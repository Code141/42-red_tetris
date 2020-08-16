import crypto from 'crypto';
import Player from './player'
import {
  checkMove,
  moveDown,
  checkLines,
  hardDrop,
  mergePieceInBuffer,
} from './rules'

class Game {
  constructor(opts) {
    this.id = crypto.randomBytes(20).toString('hex');
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
        this.broadcast_in_room('action', action)
      });
    });
    this.loop = setInterval(() => { this.nextTick() }, this.tickDuration);
  }

  stopGame() {
    if (this.loop) { clearInterval(this.loop); }
    this.loop = undefined;
  }

  nextMatch() {
    this.stopGame();
    this.startGame();
  }

  broadcast_in_room(actionName, payload) {
    this.players.forEach((player, index) => {
      player.socket.emit('action', payload);
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
        player.socket.send(tick, player.buffer);
      }
      else {

        // piece.position.y -= 1;
      }
    });

    this.broadcast_in_room('action',
      {
        type: 'NEXT_TICK',
        payload: this.concatAllBuffers(),
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

  addPlayer(socket) {
    this.players.push(new Player(socket, '#OASDLIKFJ', 'jean'));
    socket.join(this.id);
  }

  removePlayer(socket) {

    socket.leave(this.id);

    player.destroy();

    //  this.players = {}
  }

}

export default Game;
