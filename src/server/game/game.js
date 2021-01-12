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
    this.heatRoomTime = rules.heatRoomTime.value;
    this.tickDuration = rules.tickDuration.value;

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
      //player.board.clear();
      player.board = new Board(this.rules.boardWidth.value, this.rules.boardHeight.value);
      player.pieces = [];
      player.nbPiecesLanded = 0;
    })

    this.servePiece();

    /*
    this.servePiece();
    this.servePiece();
    */

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

    setTimeout(() => {
      this.startGame();
    }, 1000)
  }

  closeGame() {
    // if (this.players.length === 0) => lunch this.closeGame()
    // broadcast players and spectators "good by"
    // (emit to top level => free me)
  }

  generateNewPiece() {
    let acc = 0;
    let pieceIndex = 0;
    const position = Math.random() * this.rules.pieceProbabilitySpawn.values.reduce((sum, x) => sum + x);

    this.rules.pieceProbabilitySpawn.values.some((value, index) => {
      acc = acc + value;
      pieceIndex = index;
      return position < acc
    })
    return new Piece(pieceIndex, this.rules);
  }

  servePiece(newPiece = this.generateNewPiece()) {
    this.pieces.push(newPiece);
    this.players.forEach((player) => {
      player.pieces.push({ ...newPiece });
    });

    this.broadcast({ type: 'NEXT_PIECE', payload: newPiece.info() });
  }

  isThereAWinner() {
    const potentialWinners = this.players.filter(player => !player.loose);
    if (potentialWinners.length === 1) {
      const winner = potentialWinners[0];
      winner.score++;
      this.nextMatch();
      return true;
    }
    else if (potentialWinners.length === 0) {
      // DRAW GAME !
      this.nextMatch();
      return true;
    }
    return false;
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

    this.broadcast({ type: 'NEXT_TICK', payload: {
      tick: this.tick,
    } });

    this.tick = this.tick + 1;
  }

  addPlayer(user) {
    if (this.players.find(player => player === user)) { return false; }
//    if (this.spectator.find(spectator => spectator === user)) { return false; }

    if (this.rules.needConfirmation.value) {
      this.waitingConfirmationPlayer.push(user);
    } else {
      if (this.gameHasStarted) {
        this.confirmedPlayer.push(user);
      } else {
        this.players.push(user);
        user.status = "playing";
      }
    }

    user.board = new Board(this.rules.boardWidth.value, this.rules.boardHeight.value);

    user.room = this;

    user.socket.join(this.id);

    user.socket.emit('action', { type: 'ROOM_JOINTED', payload:
      this.info(),
    })

    return true;
  }

  removePlayer(user) {
    if (this.players.find(player => player === user)) {
      this.players.splice(this.players.indexOf(user), 1);

      user.socket.leave(this.id);
      user.leaveRoom();

      if (this.players.length === 0){
        this.emit('autodestruct');
        return;
      }

      if (this.admin === user) {
        this.admin = this.players[0];
        this.broadcast({ type: 'ADMIN_ID', payload: this.admin.id });
      }
    }

    this.broadcast({ type: 'USER_LEAVE_ROOM', payload: user.id_player});
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
