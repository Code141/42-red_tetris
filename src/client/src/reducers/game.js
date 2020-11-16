import {
  GAME_STATUS,
  ROOM_JOINTED,
  ROOM_LEAVED,
  NEXT_TICK,
  NEXT_PIECE,
  LOOSE,
  STRAFE_LEFT,
  STRAFE_RIGHT,
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
  let players, id_player;

  switch (action.type) {

  case GAME_STATUS:
    return {
      ...state,
      ...action.payload,
    }

  case LOOSE:
    players = state.players.map((player) => {
      if (player.id === action.payload.userid) { return { ...player, loose: true } }
      return { ...player }
    });

    return {
      ...state,
      players,
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

  case ROOM_LEAVED:
    return game;

  case NEXT_TICK:
    return {
      ...state,
      tick: action.payload.tick,
      players: action.payload.players,
    };

  case NEXT_PIECE:
    players = state.players.map((player) => ({
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

  case STRAFE_LEFT:
    id_player = action.payload.id_player;
    return {
      ...state,
      players: state.players.map((player, id) => {
        if (id !== id_player) { return { ...player } }
        return {
          ...player,
          pieces: player.pieces.map((piece, indexPiece) => {
            if (indexPiece !== 0) { return { ...piece } }
            return {
              ...piece,
              x: piece.x - 1,
            }
          }),
        }
      }),
    };

  case STRAFE_RIGHT:
    id_player = action.payload.id_player;
    return {
      ...state,
      players: state.players.map((player, id) => {
        if (id !== id_player) { return { ...player } }
        return {
          ...player,
          pieces: player.pieces.map((piece, indexPiece) => {
            if (indexPiece !== 0) { return { ...piece } }
            return {
              ...piece,
              x: piece.x + 1,
            }
          }),
        }
      }),
    };
  default:
    return state
  }
}

export default reducer

