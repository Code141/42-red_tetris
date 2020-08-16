import React from 'react'
import ReactDom from 'react-dom'
import { createStore, compose, applyMiddleware } from 'redux';
import { Provider } from 'react-redux'
import rootReducer from './reducers'
import App from './containers/app'
import Socket from './middleware/socket';

const socket = Socket('localhost:3004');

const composeEnhancer = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

const store = createStore(
  rootReducer,
  composeEnhancer(applyMiddleware(socket))
)

ReactDom.render((
  <Provider store={store}>
    <App/>
  </Provider>
), document.getElementById('tetris'))
