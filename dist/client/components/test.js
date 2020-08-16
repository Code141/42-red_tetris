'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _reactRedux = require('react-redux');

var _game = require('../actions/game');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var Board = function Board(_ref) {
  var game = _ref.game,
      clickOnCell = _ref.clickOnCell;

  return _react2.default.createElement(
    'div',
    { className: 'board' },
    game.map(function (line, index) {
      return _react2.default.createElement(Line, {
        key: index,
        cells: line,
        y: index,
        callback: clickOnCell
      });
    })
  );
};
var Cell2 = function Cell2(_ref2) {
  var game = _ref2.game;

  return _react2.default.createElement(
    'div',
    null,
    game
  );
};

var Line = function Line(_ref3) {
  var cells = _ref3.cells,
      y = _ref3.y,
      callback = _ref3.callback;


  return _react2.default.createElement(
    'ul',
    { className: 'line' },
    cells.map(function (cell, index) {
      return _react2.default.createElement(Cell, {
        key: index,
        cell: cell,
        x: index,
        y: y,
        callback: callback
      });
    })
  );
};
var Cell = function Cell(_ref4) {
  var cell = _ref4.cell,
      x = _ref4.x,
      y = _ref4.y,
      callback = _ref4.callback;

  return _react2.default.createElement(
    'li',
    {
      className: 'cell',
      onClick: function onClick() {
        callback({ x: x, y: y });
      }
    },
    cell
  );
};

var mapStateToProps = function mapStateToProps(state) {
  return {
    game: state.game
  };
};

var mapDispatchToProps = function mapDispatchToProps(dispatch, payload) {
  return {
    clickOnCell: function clickOnCell(cell) {
      return dispatch((0, _game.gameAction)(cell));
    }
  };
};

exports.default = (0, _reactRedux.connect)(mapStateToProps, mapDispatchToProps)(Board);