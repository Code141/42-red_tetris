import {
  SET_FORM,
  UPDATE_PIECE,
  RESET_FORM
} from '../actions/roomForm'

import default_rules from '../game/default_rules.json'

const reducer = (state = default_rules, action) => {


  switch (action.type) {
    case SET_FORM:
      return {
        ...state,
        [action.payload.key]: {
          ...state[action.payload.key],
          value: action.payload.value
        }
      }
    case UPDATE_PIECE:
      let values = [...state['pieces'].values];
      values[action.payload.index] = action.payload.buffer;
      let pieceProbabilitySpawn = [...state['pieces'].pieceProbabilitySpawn];
      pieceProbabilitySpawn[action.payload.index] = action.payload.proba;
      let pieceColors = [...state['pieces'].pieceColors];
      pieceColors[action.payload.index] = action.payload.color;

      return {
        ...state,
        'pieces': {
          ...state['pieces'],
          values: values,
          pieceProbabilitySpawn: pieceProbabilitySpawn,
          pieceColors: pieceColors
        }
      }

    case RESET_FORM:
      return {
        ...default_rules
      }
    default:
      return state
  }
}

export default reducer
