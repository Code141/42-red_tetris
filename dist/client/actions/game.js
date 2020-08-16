'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});
var GAME_ACTION = exports.GAME_ACTION = 'GAME_ACTION';

var gameAction = exports.gameAction = function gameAction(cell) {
  console.log(cell);
  return {
    type: GAME_ACTION,
    payload: cell
  };
};