export const GAME_ACTION = 'GAME_ACTION'

export const gameAction = (cell) => {
  console.log(cell)
  return {
    type: GAME_ACTION,
    payload: cell,
  }
}

