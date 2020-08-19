"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _react = _interopRequireDefault(require("react"));

var _reactRouterDom = require("react-router-dom");

var _reactRedux = require("react-redux");

var _test = _interopRequireDefault(require("../components/test"));

var _form = _interopRequireDefault(require("../components/form"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const App = ({
  message
}) => /*#__PURE__*/_react.default.createElement("div", {
  className: "wrap"
}, /*#__PURE__*/_react.default.createElement(_reactRouterDom.BrowserRouter, null, /*#__PURE__*/_react.default.createElement("nav", null, /*#__PURE__*/_react.default.createElement("ul", null, /*#__PURE__*/_react.default.createElement("li", null, /*#__PURE__*/_react.default.createElement(_reactRouterDom.Link, {
  to: "/"
}, "Home")), /*#__PURE__*/_react.default.createElement("li", null, /*#__PURE__*/_react.default.createElement(_reactRouterDom.Link, {
  to: "/game"
}, "Game")))), /*#__PURE__*/_react.default.createElement("hr", null), /*#__PURE__*/_react.default.createElement(_reactRouterDom.Switch, null, /*#__PURE__*/_react.default.createElement(_reactRouterDom.Route, {
  path: "/game"
}, /*#__PURE__*/_react.default.createElement(_test.default, null)), /*#__PURE__*/_react.default.createElement(_reactRouterDom.Route, {
  path: "/"
}, /*#__PURE__*/_react.default.createElement(_form.default, null)))));

var _default = App;
exports.default = _default;