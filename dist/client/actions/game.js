"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.gameAction = exports.GAME_ACTION = void 0;
const GAME_ACTION = 'GAME_ACTION';
exports.GAME_ACTION = GAME_ACTION;

const gameAction = cell => {
  console.log(cell);
  return {
    type: GAME_ACTION,
    payload: cell
  };
};

exports.gameAction = gameAction;