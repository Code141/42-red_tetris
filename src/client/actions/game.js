export const GAME_ACTION = 'GAME_ACTION';
export const ROOM_JOINTED = 'ROOM_JOINTED';
export const NEXT_TICK = 'NEXT_TICK';

export const gameAction = (cell) => {
  console.log(cell)
  return {
    type: GAME_ACTION,
    payload: cell,
  }
}

