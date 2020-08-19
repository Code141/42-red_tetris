"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _redux = require("redux");

var _user = _interopRequireDefault(require("./user"));

var _game = _interopRequireDefault(require("./game"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const rootReducer = (0, _redux.combineReducers)({
  user: _user.default,
  game: _game.default
});
var _default = rootReducer;
exports.default = _default;