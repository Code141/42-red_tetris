import crypto from 'crypto'
import EventEmitter from 'events'
import { moveDown, strafeLeft, strafeRight, checkCollision, rotate } from './rules.js'

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
    this.status = undefined;

    this.socket.on('move', (action) => {
      if (!this.room || !this.room.gameHasStarted || this.status !== "playing")
        return;

      if (action.payload === 'ROTATE' &&
        rotate(this.board, this.pieces[this.nbPiecesLanded])) {
        this.room.broadcast({ type: 'ROTATE', payload: {
          id_player: this.id_player,
        },
        });
      }

      if (action.payload === 'STRAFE_LEFT' &&
        strafeLeft(this.board, this.pieces[this.nbPiecesLanded])) {
        this.room.broadcast({ type: 'STRAFE_LEFT', payload: {
          id_player: this.id_player,
        },
        });
      }

      if (action.payload === 'STRAFE_RIGHT' &&
        strafeRight(this.board, this.pieces[this.nbPiecesLanded])) {
        this.room.broadcast({ type: 'STRAFE_RIGHT', payload: {
          id_player: this.id_player,
        },
        });
      }
    });
  }

  gravityTick() {
    if (!moveDown(this.board, this.pieces[this.nbPiecesLanded])) {
      this.landPiece();
    }
  }

  landPiece() {
    this.room.broadcast({ type: 'LAND_PIECE', payload: {
      id_player: this.id_player
    }});

    this.board.mergePiece(this.pieces[this.nbPiecesLanded]);
    this.nbPiecesLanded++;


    const linesToDelete = this.board.checkLine();
    const nbLinesToDelete = linesToDelete.length;

    if (nbLinesToDelete > 0) {
      this.board.deleteLines(linesToDelete);
      this.room.broadcast({ type: 'DELETE_LINES', payload: {
        id_player: this.id_player,
        linesToDelete: linesToDelete
      }});
    }

    this.getNextPiece();

    if (checkCollision(this.board, this.pieces[this.nbPiecesLanded])) {
      console.log('LOOSER');
      this.loose = true;
      this.room.broadcast({ type: 'LOOSE', payload: {
        userid: this.id,
      }});
    }
  }

  getNextPiece() {
    if (this.nbPiecesLanded + 2 > this.pieces.length) {
      /*
      if (this.nbPiecesLanded + 1 < this.room.pieces.length) {
        this.pieces.push({ ...this.room.pieces[this.nbPiecesLanded] });
      }
      */
      this.room.servePiece();
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
        rotation: piece.rotation
      })),
      board: this.board,
    }
  }

}

export default Player;
