import crypto from 'crypto'
import EventEmitter from 'events'
import { moveDown, strafeLeft, strafeRight, checkCollision } from './rules.js'

class Player extends EventEmitter {
  constructor(socket, username) {
    super();

    this.id = crypto.randomBytes(3).toString('hex');
    this.id_player = undefined;
    this.socket = socket;
    this.username = username;
    this.room = null;

    this.score = 0;

    this.loose = false;
    this.nbPiecesLanded = 0;
    this.pieces = [];

    this.board = undefined;

    this.socket.on('move', (action) => {
      if (!this.room || !this.room.gameHasStarted)
        return;

      if (action.payload === 'STRAFE_LEFT' &&
        strafeLeft(this.board, this.pieces[0])) {
        this.room.broadcast('action', { type: 'STRAFE_LEFT', payload: {
          id_player: this.id_player,
        },
        });
      }

      if (action.payload === 'STRAFE_RIGHT' &&
        strafeRight(this.board, this.pieces[0])) {
        this.room.broadcast('action', { type: 'STRAFE_RIGHT', payload:
          {
            id_player: this.id_player,
          },
        });
      }
    });
  }

  gravityTick() {
    if (!moveDown(this.board, this.pieces[0])) {
      this.landPiece();
    }
  }

  landPiece() {
    this.board.mergePiece(this.pieces[0]);
    this.nbPiecesLanded++;
    this.pieces.shift();

    const linesToDelete = this.board.checkLine();
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
      this.room.isThereAWinner();

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
    if (this.room) { this.leaveRoom() }

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
      loose: this.loose,
      nbPiecesLanded: this.nbPiecesLanded,
      pieces: this.pieces.map(piece => ({
        id: piece.id,
        x: piece.x,
        y: piece.y,
      })),
      board: this.board,
    }
  }

}

export default Player;
