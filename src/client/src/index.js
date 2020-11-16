import React from 'react'
import ReactDom from 'react-dom'

import { createStore, compose, applyMiddleware } from 'redux';
import { Provider } from 'react-redux'

import rootReducer from './reducers'

import Socket from './middleware/socket';

import App from './containers/app'

import history from './hooks/history';
import { BrowserRouter as Router } from 'react-router-dom';

import './css/reset.css'
import './css/style.css'

const composeEnhancer = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const socket = Socket('localhost:3004');

const store = createStore(
  rootReducer,
  composeEnhancer(applyMiddleware(socket))
)

ReactDom.render((
  <React.StrictMode>
    <Provider store={store}>
      <Router history={history}>
        <App/>
      </Router>
    </Provider>
  </React.StrictMode>
), document.getElementById('root'))

