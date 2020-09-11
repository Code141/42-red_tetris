import crypto from 'crypto'
import Player from './player'
import {
  moveDown,
  checkLines,
  mergePieceInBuffer,
} from '../game/rules'

class Game {
  constructor(opts, user) {
    this.id = crypto.randomBytes(3).toString('hex');
    this.admin = user;
    this.spectators = [];
    this.players = [];

    this.gameHasStarted = false;
    this.gameStartIn = opts.heatRoomTime;
    this.tickDuration = opts.tickDuration;
    this.gameRules = {
      gridx: opts.gridx,
      gridy: opts.gridy,
    }
    this.tick = 0;

    setTimeout(() => { this.startGame() }, this.heatRoomTime)
  }

  startGame() {
    this.tick = 0;
    this.players.forEach((player) => {
      player.resetForNextMatch(this.gameRules);
      player.on('action_valid', (action) => {
        this.broadcast('action', action)
      });
    });
    this.loop = setInterval(() => { this.nextTick() }, this.tickDuration);
  }

  stopGame() {
    if (this.loop) { clearInterval(this.loop); }
    this.loop = undefined;
  }

  // if (this.players.length === 0) => lunch this.closeGame()
  closeGame() {
    // broadcast players and spectators "good by"
    // (emit to top level => free me)
  }

  nextMatch() {
    this.stopGame();
    this.startGame();
  }

  broadcast(actionName, payload) {
    this.players.forEach((player, index) => {
      player.socket.emit('action', payload);
    });

    this.spectators.forEach((spectator, index) => {
      spectator.socket.emit('action', payload);
    });
  }

  nextTick() {
    this.players.forEach((player, index) => {
      const piece = player.pieces[0];
      const pieceHasLanded = moveDown(player.buffer, piece);
      if (pieceHasLanded) {
        player.buffer = mergePieceInBuffer()
        player.pieces.shift();
        checkLines(player.buffer);
        player.socket.send('tick', player.buffer);
      }
      else {
        // piece.position.y -= 1;
      }
    });

    this.broadcast('action',
      {
        type: 'NEXT_TICK',
        payload: this.tick, // this.concatAllBuffers(),
      }
    );

    this.tick = this.tick + 1;
  }

  concatAllBuffers() {
    let totalLength = 0;
    const buffersToSend = this.players.map((player, index) => {
      totalLength = totalLength + player.buffer.length;
      return player.buffer;
    });
    return Buffer.concat(buffersToSend, totalLength);
  }

  addPlayer(user) {
    if (this.players.find(player => user === player)) { return false; }

    this.players.push(user);
    user.socket.join(this.id);
    return true;
  }

  removePlayer(socket) {

    socket.leave(this.id);

    player.destroy();

    //  this.players = {}
  }

}

export default Game;
