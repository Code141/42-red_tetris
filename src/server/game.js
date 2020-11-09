import crypto from 'crypto'
import default_rules from '../game/default_rules'
import Player from './player'
import Piece from '../game/piece'
import Board from '../game/board'

class Game {
  constructor(opts, user) {
    this.id = crypto.randomBytes(3).toString('hex');
    this.admin = user;
    this.spectators = [];
    this.players = [];
    this.pieces = [];

    this.rules = default_rules; // PARSE USER RULES HERE

    this.gameHasStarted = false;
    this.heatRoomTime = opts.heatRoomTime;
    this.tickDuration = opts.tickDuration;

    this.tick = 0;
    this.round = 0;
  }

  startGame() {
    console.log('START GAME')
    if (this.gameHasStarted) { return; }
    this.gameHasStarted = true;
    this.round++;

    this.tick = 0;
    this.pieces = [];
    this.players.forEach(player => {
      player.loose = false;
      player.board.clear();
      player.pieces = [];
      player.nbPiecesLanded = 0;
    })

    this.servePiece();

    /*
    this.servePiece();
    this.servePiece();
    */
    this.broadcast('action', { type: 'GAME_STATUS', payload:
      this.info(),
    });

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
    this.broadcast('action', { type: 'GAME_STATUS', payload: {
      gameHasStarted: false,
    } });
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

  broadcast(actionName, payload) {
    this.players.forEach((player, index) => {
      player.socket.emit(actionName, payload);
    });
    this.spectators.forEach((spectator, index) => {
      spectator.socket.emit(actionName, payload);
    });
  }

  generateNewPiece() {
    let acc = 0;
    let pieceIndex = 0;
    const position = Math.random() * this.rules.pieceProbabilitySpawn.reduce((sum, x) => sum + x);

    this.rules.pieceProbabilitySpawn.some((value, index) => {
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

    this.broadcast('action', { type: 'NEXT_PIECE', payload:
      newPiece.info(),
    });
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

  nextTick() {
    this.players.forEach((player) => {
      if (!player.loose) {
        player.gravityTick();
      }
    });

    this.broadcast('action', { type: 'NEXT_TICK', payload: {
      tick: this.tick,
      players: this.players.map((player) => player.info()),
    } });

    this.tick = this.tick + 1;
  }

  addPlayer(user) {
    if (this.players.find(player => player === user)) { return false; }
    this.players.push(user);

    user.board = new Board(this.rules.board.width, this.rules.board.height);
    user.room = this;

    // user.socket.join(this.id); FOR BROADCAST

    user.socket.emit('action', { type: 'ROOM_JOINTED', payload:
      this.info(),
    })
    return true;
  }

  removePlayer(user) {
    if (this.players.find(player => player === user)) {
      this.players.splice(this.players.indexOf(user), 1);
      user.leaveRoom();
    }

    /*
    player.socket.leave(this.id);
    this.players.destroy();
    */
    //  this.players = {}

    /*
      if (this.players.length === 0){
        this.emit('autodestruct')
        }
        */
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
