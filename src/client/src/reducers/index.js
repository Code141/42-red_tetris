import { combineReducers } from 'redux'
import user from './user'
import game from './game'
import rooms from './rooms'
import roomForm from './roomForm'

const rootReducer = combineReducers({
  user,
  game,
  rooms,
  roomForm,
})

export default rootReducer
