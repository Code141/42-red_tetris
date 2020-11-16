import { combineReducers } from 'redux'
import user from './user'
import game from './game'
import rooms from './rooms'

const rootReducer = combineReducers({
  user,
  game,
  rooms,
})

export default rootReducer
