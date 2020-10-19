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
    if (this.gameHasStarted) { return; }
    this.gameHasStarted = true;
    this.round++;
    this.tick = 0;

    /*
    this.servePiece();
    this.servePiece();
    this.servePiece();
    */

    let NP = new Piece(6, this.rules);
    NP.x = 9;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 8;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 7;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 6;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 5;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 4;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 3;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 2;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 1;
    this.servePiece(NP);
    NP = new Piece(6, this.rules);
    NP.x = 0;
    this.servePiece(NP);

    this.broadcast('action', { type: 'GAME_STARTED', payload: null });

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
  }

  closeGame() {
    // if (this.players.length === 0) => lunch this.closeGame()
    // broadcast players and spectators "good by"
    // (emit to top level => free me)
  }

  nextMatch() {
    this.stopGame();
    this.startGame();
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

  servePiece(newPiece) {
    if (newPiece === undefined) { newPiece = this.generateNewPiece(); }
    this.pieces.push(newPiece);
    this.players.forEach((player) => {
      player.pieces.push({ ...newPiece });
    });

    this.broadcast('action', { type: 'NEXT_PIECE', payload: {
      id: newPiece.id,
      x: newPiece.x,
      y: newPiece.y,
      rotation: newPiece.rotation,
    } });
  }

  nextTick() {

    let loosers = 0;

    this.players.forEach((player) => {
      if (player.loose) {
        loosers++;
      }
    });

    if (loosers === this.players.length) {
      this.stopGame();
    }

    // IF PIECE IS INTO SOMETHING, YOU LOOSE

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

    user.socket.emit('action', { type: 'ROOM_JOINTED', payload: {
      id: this.id,
      admin: this.admin.id,
      players: this.players.map((player) => player.info()),
      spectators: this.spectators.map((spectator) => ({
        id: spectator.id,
        username: spectator.username,
      })),
      gameHasStarted: this.gameHasStarted,
      rules: this.rules,
    } })

    return true;
  }

  removePlayer(player) {
    if (this.players.find(player => player === user)) {
      this.players.splice(this.players.indexOf(player), 1);
      player.leaveRoom();
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

}

export default Game;
