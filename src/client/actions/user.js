export const SET_USERNAME = 'SET_USERNAME'

export const setUserNameAction = (name) => {
  return {
    type: SET_USERNAME,
    payload: name,
  }
}

