import { GAME_ACTION, ROOM_JOINTED, NEXT_TICK } from '../actions/game'

const game = {
  id: null,
  admin: null,
  players: [],
  spectators: [],
  tick: 0,
  board: [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ],
};

const reducer = (state = game, action) => {
  switch (action.type) {
  case GAME_ACTION:
    const { x, y } = action.payload;

    const newState = [...state];
    newState[y][x] = (state[y][x] + 1) % 10;

    console.log(newState);

    return newState;

  case ROOM_JOINTED:
    return {
      ...state,
      id: action.payload.id,
      admin: action.payload.admin,
      players: action.payload.players,
      spectators: action.payload.spectators,
    };

  case NEXT_TICK:
    return {
      ...state,
      tick: action.payload,
    };
  default:
    return state
  }
}

export default reducer

