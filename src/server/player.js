import crypto from 'crypto'
import { moveDown, strafeLeft, strafeRight, checkCollision, mergePieceInBoard, checkLine } from '../game/rules'
import EventEmitter from 'events'

class Player extends EventEmitter {
  constructor(socket, username) {
    super();

    this.id = crypto.randomBytes(3).toString('hex');
    this.socket = socket;
    this.username = username;
    this.room = null;

    this.score = 0;
    this.loose = false;
    this.nbPiecesLanded = 0;
    this.pieces = [];

    this.board = undefined;

    this.socket.on('move', (action) => {

      if (action.payload === 'strafeLeft' &&
        strafeLeft(this.board, this.pieces[0])) {
        this.socket.emit('move', { type: action.payload });
      }

      if (action.payload === 'strafeRight' &&
        strafeRight(this.board, this.pieces[0])) {
        this.socket.emit('move', { type: action.payload });
      }
    });

  }

  gravityTick() {
    if (!moveDown(this.board, this.pieces[0])) {
      this.landPiece();
    }
  }

  landPiece() {
    mergePieceInBoard(this.board, this.pieces[0]);
    this.nbPiecesLanded++;
    this.pieces.shift();

    const linesToDelete = checkLine(this.board);
    const nbLinesToDelete = linesToDelete.length;
    if (nbLinesToDelete > 0) {
      this.board.deleteLines(linesToDelete);
    }

    this.getNextPiece();
    if (checkCollision(this.board, this.pieces[0])) {
      this.loose = true;
      this.room.broadcast('fact', { type: 'LOOSE', payload: {
        userid: this.id,
      } });

    }
  }

  getNextPiece() {
    if (this.pieces.length <= 0) {
      if (this.nbPiecesLanded < this.room.pieces.length) {
        this.pieces.push({ ...this.room.pieces[this.nbPiecesLanded] });
      }
      else {
        this.room.servePiece();
      }
    }
  }

  jointRoom(room) {
    this.room = room;

    // ADD LISTNER
  }

  leaveRoom() {
    if (this.room) {
      this.room.removePlayer(this);
      this.room = undefined;
      this.pieces = [];
      this.score = 0;

      // REMOVE LISTNER
    }
  }

  info() {
    return {
      id: this.id,
      username: this.username,
      score: this.score,
      nbPiecesLanded: this.nbPiecesLanded,
      pieces: this.pieces.map((piece) => ({
        id: piece.id,
        x: piece.x,
        y: piece.y,
      })),
      board: this.board,
    }
  }

}

export default Player;
