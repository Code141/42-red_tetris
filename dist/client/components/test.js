"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _reactRedux = require("react-redux");

var _game = require("../actions/game");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const Board = ({
  game,
  clickOnCell
}) => /*#__PURE__*/_react.default.createElement("div", {
  className: "board"
}, game.map((line, index) => /*#__PURE__*/_react.default.createElement(Line, {
  callback: clickOnCell,
  cells: line,
  key: index,
  y: index
})));

const Cell2 = ({
  game
}) => /*#__PURE__*/_react.default.createElement("div", null, game);

const Line = ({
  cells,
  y,
  callback
}) => /*#__PURE__*/_react.default.createElement("ul", {
  className: "line"
}, cells.map((cell, index) => /*#__PURE__*/_react.default.createElement(Cell, {
  callback: callback,
  cell: cell,
  key: index,
  x: index,
  y: y
})));

const Cell = ({
  cell,
  x,
  y,
  callback
}) => /*#__PURE__*/_react.default.createElement("li", {
  className: "cell",
  onClick: () => {
    callback({
      x,
      y
    });
  }
}, cell);

const mapStateToProps = state => ({
  game: state.game
});

const mapDispatchToProps = (dispatch, payload) => ({
  clickOnCell: cell => dispatch((0, _game.gameAction)(cell))
});

var _default = (0, _reactRedux.connect)(mapStateToProps, mapDispatchToProps)(Board);

exports.default = _default;