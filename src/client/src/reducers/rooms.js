const rooms = [];

const reducer = (state = rooms, action) => {
  switch (action.type) {

  case 'ROOM_LIST':
    return action.payload

  case 'ROOM_CREATED':
    return [
      ...state,
      action.payload,
    ]
  default:
    return state
  }
}

export default reducer

