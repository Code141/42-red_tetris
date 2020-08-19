"use strict";

var _react = _interopRequireDefault(require("react"));

var _reactDom = _interopRequireDefault(require("react-dom"));

var _redux = require("redux");

var _reactRedux = require("react-redux");

var _reducers = _interopRequireDefault(require("./reducers"));

var _app = _interopRequireDefault(require("./containers/app"));

var _socket = _interopRequireDefault(require("./middleware/socket"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const socket = (0, _socket.default)('localhost:3004');
const composeEnhancer = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || _redux.compose;
const store = (0, _redux.createStore)(_reducers.default, composeEnhancer((0, _redux.applyMiddleware)(socket)));

_reactDom.default.render( /*#__PURE__*/_react.default.createElement(_reactRedux.Provider, {
  store: store
}, /*#__PURE__*/_react.default.createElement(_app.default, null)), document.getElementById('tetris'));