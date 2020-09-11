import React from 'react'
import ReactDom from 'react-dom'
import { createStore, compose, applyMiddleware } from 'redux';
import { Provider } from 'react-redux'
import rootReducer from './reducers'
import App from './containers/app'
import Socket from './middleware/socket';
import { BrowserRouter as Router } from 'react-router-dom';
import history from './history';

const composeEnhancer = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const socket = Socket('localhost:3004');

const store = createStore(
  rootReducer,
  composeEnhancer(applyMiddleware(socket))
)

ReactDom.render((
  <Provider store={store}>
    <Router history={history}>
      <App/>
    </Router>
  </Provider>
), document.getElementById('tetris'))

