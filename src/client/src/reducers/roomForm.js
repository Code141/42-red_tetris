import {
  SET_FORM,
  RESET_FORM
} from '../actions/roomForm'

import default_rules from '../game/default_rules.json'

const reducer = (state = default_rules, action) => {


  switch (action.type) {
    case SET_FORM:
      if (action.payload.key === "pieces")
      {
        let {index, buffer, proba, color} = action.payload.value;

        let values = [...state['pieces'].values];
        values[index] = buffer;

        let pieceProbabilitySpawn = [...state['pieces'].pieceProbabilitySpawn];
        pieceProbabilitySpawn[index] = proba;

        let pieceColors = [...state['pieces'].pieceColors];
        pieceColors[index] = color;

        return {
          ...state,
          'pieces': {
            ...state['pieces'],
            values: values,
            pieceProbabilitySpawn: pieceProbabilitySpawn,
            pieceColors: pieceColors
          }
        }
      }
      return {
        ...state,
        [action.payload.key]: {
          ...state[action.payload.key],
          value: action.payload.value
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
