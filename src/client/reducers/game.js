import {
  GAME_STARTED,
  ROOM_JOINTED,
  LEAVE_ROOM,
  NEXT_TICK,
  NEXT_PIECE,
  LOOSE,
} from '../actions/game'

const game = {
  id: null,
  admin: null,
  players: [],
  pieces: [],
  spectators: [],
  tick: 0,
};

const reducer = (state = game, action) => {
  switch (action.type) {

  case GAME_STARTED:
    return {
      ...state,
      gameHasStarted: true,
    }

  case LOOSE:
    return {
      ...state,
      gameHasStarted: true,
    }

  case ROOM_JOINTED:
    return {
      ...state,
      id: action.payload.id,
      admin: action.payload.admin,
      players: action.payload.players,
      spectators: action.payload.spectators,
      gameHasStarted: action.payload.gameHasStarted,
      rules: action.payload.rules,
    };

  case LEAVE_ROOM:
    return game;

  case NEXT_TICK:
    return {
      ...state,
      tick: action.payload.tick,
      players: action.payload.players,
    };

  case NEXT_PIECE:
    const players = state.players.map((player) => ({
      ...player,
      pieces: [
        ...player.pieces,
        action.payload,
      ],
    }));

    return {
      ...state,
      players,
      pieces: [
        ...state.pieces,
        action.payload,
      ],
    };

    /*
  case STRAFE_LEFT:
    return {
      ...state,
      tick: action.payload.tick,
      boards: action.payload.boards,
    };
    */
  default:
    return state
  }
}

export default reducer

