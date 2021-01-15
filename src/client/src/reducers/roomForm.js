import {
  SET_FORM
} from '../actions/roomForm'

import default_rules from '../game/default_rules.json'

const roomForm = {
};

const reducer = (state = default_rules, action) => {
  console.log(action);
  switch (action.type) {
    case SET_FORM:
      console.log("ASEDGBLKHJ");
      return {
        ...state,
        [action.payload.key]: {
          ...state[action.payload.key],
          value: action.payload.value
        }
      }

    default:
      return state
  }
}

export default reducer

