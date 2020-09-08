import crypto from 'crypto'
import { checkMove } from '../game/rules'
import EventEmitter from 'events'

class Player extends EventEmitter {
  constructor(socket, pseudo) {
    super();
    this.id = crypto.randomBytes(20).toString('hex');
    this.pseudo = pseudo;
    this.socket = socket;
    this.score = 0;
    this.pieces = [];
    this.room = null;

    //  this.buffer = undefined;

    this.socket.on(
      'reciveAction',
      (data) => {
        if (checkMove(this.buffer, data.action, this.pieces[0])) {
          this.emit('action_valid', data.action)
        }
        else {
          this.socket.send(
            'action_invalid',
            {
              action: data.action,
              status: 'invalid',
            }
          )
        }
      }
    );
  }

  resetForNextMatch(gameRules) {
    this.buffer = Buffer.alloc(gameRules.gridx * gameRules.gridy);
  }
}

export default Player;
