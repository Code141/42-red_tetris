import crypto from 'crypto'
import EventEmitter from 'events'
import Player from './player.js'
import Piece from './piece.js'
import Board from './board.js'

class Game extends EventEmitter {
  constructor(rules, user, socketio) {
    super();
    this.socketio = socketio;
    this.id = crypto.randomBytes(3).toString('hex');
    this.spectators = [];
    this.waitingConfirmationPlayer = [];
    this.players = [];
    this.confirmedPlayer = [];
    this.pieces = [];

    // this.rules = (rules) ? rules : default_rules;
    this.rules = rules; // PARSE USER RULES HERE

    this.gameHasStarted = false;
    this.heatRoomTime = rules.heatRoomTime;
    this.tickDuration = rules.tickDuration;

    this.tick = 0;
    this.round = 0;

    this.admin = user;
    this.addPlayer(user);
  }

  startGame() {
    console.log('START GAME')

    if (this.gameHasStarted) { return; }
    this.gameHasStarted = true;
    this.round++;

    this.tick = 0;
    this.pieces = [];

    this.confirmedPlayer.forEach((player, id) => {
      player.status = "playing";
      this.players.push(player)
    });
    this.confirmedPlayer = [];

    this.players.forEach((player, id) => {
      player.id_player = id;
      player.loose = false;
      player.board.clear();
      player.pieces = [];
      player.nbPiecesLanded = 0;
    })

    this.servePiece();
    this.servePiece(); // NEED SERVE TWO PICE FOR PREVIEW NEXT PIECE

    this.broadcast({ type: 'GAME_STATUS', payload: this.info() });

    setTimeout(() => {
      this.loop = setInterval(() => {
        this.nextTick()
      }, this.tickDuration);
    }, this.heatRoomTime)
  }

  stopGame() {
    if (this.loop) { clearInterval(this.loop); }
    this.loop = undefined;
    this.gameHasStarted = false;
    console.log('STOP GAME')

    /*
    this.broadcast({ type: 'GAME_STATUS', payload: { gameHasStarted: false }});
    */
  }

  nextMatch() {
    this.stopGame();

    if (this.players.length === 0) {
      this.autodestruct();
      return;
    }
    setTimeout(() => {
      this.startGame();
    }, this.rules.looseWaiting)
  }

  closeGame() {
    // if (this.players.length === 0) => lunch this.closeGame()
    // broadcast players and spectators "good by"
    // (emit to top level => free me)
  }


  getProbabilityPieceIndex() {
    let pieceProbabilitySpawn = this.rules.pieces.pieceProbabilitySpawn;
    const position = Math.random() * pieceProbabilitySpawn.reduce((sum, x) => sum + x);

    let acc = 0;
    let pieceIndex = 0;
    pieceProbabilitySpawn.some((value, index) => {
      acc = acc + value;
      pieceIndex = index;
      return position < acc
    })
    return pieceIndex;
  }



  servePiece() {
    let pieceIndex = this.getProbabilityPieceIndex();
    const piece = this.rules.pieces.values[pieceIndex];
    let position = Math.round( Math.random() * (this.rules.boardWidth - piece.width));

    let newPiece = new Piece(piece, pieceIndex, position);

    this.pieces.push(newPiece);

    this.players.forEach((player) => {
      player.pieces.push(new Piece(piece, pieceIndex, position));
    });

    this.broadcast({ type: 'NEXT_PIECE', payload: newPiece.info() });
  }

  isThereAWinner() {
    const potentialWinners = this.players.filter(player => !player.loose);
    if (potentialWinners.length === 1 && this.players.length > 1) {
      const winner = potentialWinners[0];
      winner.score++;
      this.nextMatch();
    }
    else if (potentialWinners.length === 0) {
      // DRAW GAME !
      console.log('DRAW');
      this.nextMatch();
    }
  }

  broadcast(payload) {
    this.socketio.to(this.id).emit('action', {...payload, tick: this.tick});
  }

  nextTick() {
    this.players.forEach((player) => {
      if (!player.loose) {
        player.gravityTick();
      }
    });

    this.isThereAWinner();

    this.broadcast({ type: 'NEXT_TICK', payload: {
      tick: this.tick,
    } });

    this.tick = this.tick + 1;
  }

  addPlayer(user) {
    if (this.players.find(player => player === user)) { return false; }
    if (this.confirmedPlayer.find(player => player === user)) { return false; }
    if (this.waitingConfirmationPlayer.find(player => player === user)) { return false; }
    //    if (this.spectator.find(spectator => spectator === user)) { return false; }

    if (this.rules.needConfirmation) {
      this.waitingConfirmationPlayer.push(user);
    } else {
      this.confirmedPlayer.push(user);
    }

    user.board = new Board(this.rules.boardWidth, this.rules.boardHeight);
    user.room = this;
    user.socket.join(this.id);
    user.socket.emit('action', { type: 'ROOM_JOINTED', payload:
      this.info(),
    })

    return true;
  }

  removePlayer(user) {
    let finded = false;
    if (this.players.find(player => player === user)){
      this.players.splice(this.players.indexOf(user), 1);
      finded = true;
    }

    if (this.waitingConfirmationPlayer.find(player => player === user)) {
      this.waitingConfirmationPlayer.splice(this.waitingConfirmationPlayer.indexOf(user), 1);
      finded = true;
    }

    if (this.confirmedPlayer.find(player => player === user)) {
      this.confirmedPlayer.splice(this.confirmedPlayer.indexOf(user), 1);
      finded = true;
    }

    if (!finded)
      return;

    user.socket.leave(this.id);
    user.leaveRoom();

    if (this.players.length === 0) {
      if (this.confirmedPlayer.length === 0) {
        if (this.waitingConfirmationPlayer.length === 0) {
          this.emit('autodestruct');
          return;
        } else {
          this.waitingConfirmationPlayer.forEach((player, id) => {
            this.waitingConfirmationPlayer.push(player)
          });
          this.waitingConfirmationPlayer = [];
        }
      } else {
        this.confirmedPlayer.forEach((player, id) => {
          player.status = "playing";
          this.players.push(player)
        });
        this.confirmedPlayer = [];
      }
      this.nextMatch();
    }

    if (this.admin === user) {
      this.admin = this.players[0];
      this.broadcast({ type: 'ADMIN_ID', payload: this.admin.id });
    }
    this.broadcast({ type: 'USER_LEAVE_ROOM', payload: user.id_player});
    this.players.forEach((player, id) => { player.id_player = id; })
}

autodestruct(){
  this.players.forEach(player => this.removePlayer(player));
  // this.spectator.forEach(spectator => this.removeSpectator(spectator));
}

info() {
  return ({
    id: this.id,
    admin: this.admin.id,
    players: this.players.map(player => player.info()),
    pieces: this.pieces.map(piece => piece.info()),
    spectators: this.spectators.map(spectator => ({
      id: spectator.id,
      username: spectator.username,
    })),
    gameHasStarted: this.gameHasStarted,
    rules: this.rules,
  });
}

}

export default Game;
