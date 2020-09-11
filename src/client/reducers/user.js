import { SET_USERNAME } from '../actions/user'

const user = {
  id: '',
  name: 'johnDoe',
};

const reducer = (state = user, action) => {
  switch (action.type) {

  case SET_USERNAME:
    return {
      ...state,
      name: action.payload,
    };

  default:
    return state
  }
}

export default reducer

