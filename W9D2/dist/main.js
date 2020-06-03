/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// import MovingObject from './moving_object';\n// import Util from './util';\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nconst AST_CONST = {\n  COLOR: 'black',\n  RADIUS: 25\n}\n\nfunction Asteroid (options) {\n    options.vel = Util.randomVec(10);\n    options.color = AST_CONST.COLOR;\n    options.radius = AST_CONST.RADIUS;\n  \n    MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\n\nmodule.exports = Asteroid;\n\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nconst GAME_CONSTANTS = {\n  DIM_X: 500,\n  DIM_Y: 500,\n  NUM_ASTEROIDS: 3\n}\n\nfunction Game () {\n  this.dim_x = GAME_CONSTANTS.DIM_X;\n  this.dim_y = GAME_CONSTANTS.DIM_Y;\n  this.num_asteroids = GAME_CONSTANTS.NUM_ASTEROIDS;\n  this.asteroids = [];\n\n  this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function () {\n  for (let i = 0; i < GAME_CONSTANTS.NUM_ASTEROIDS; i++) {\n    this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}));\n  }\n}\n\nGame.prototype.randomPosition = function() {\n  let x = Math.floor((Math.random() * GAME_CONSTANTS.DIM_X));\n  let y = Math.floor((Math.random() * GAME_CONSTANTS.DIM_Y));\n\n  return [x, y];\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, GAME_CONSTANTS.DIM_X, GAME_CONSTANTS.DIM_Y);\n  this.asteroids.forEach( function(asteroid) {\n    asteroid.draw(ctx);\n  })\n}\n\nGame.prototype.moveObjects = function() {\n  this.asteroids.forEach( function(asteroid) {\n    asteroid.move();\n  })\n}\n\nGame.prototype.wrap = function (pos) {\n    if(pos[0] < 0) {\n      pos[0] = GAME_CONSTANTS.DIM_X;\n     } else if(pos[0] > GAME_CONSTANTS.DIM_X) {\n      pos[0] = 0;\n     } else if(pos[1] < 0) {\n       pos[1] = GAME_CONSTANTS.DIM_Y;\n     } else if(pos[1] > GAME_CONSTANTS.DIM_Y) {\n       pos[1] = 0;\n     }\n  }\n  \n  \n  //iterate through all asteroids\n  //check pos components to see if <= 0 or >= max\n  //  if so invert component which is maxing or mining out => (200, 515)\n\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\"); //why two r's\n\nfunction GameView (ctx) {\n  this.game = new Game();\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function () {\n  let that = this;\n  setInterval( function () {\n    that.game.moveObjects();\n    that.game.draw(that.ctx);\n  },\n    100);\n}\n\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.addEventListener('DOMContentLoaded', () => {\n  window.Game = Game;\n  window.MovingObject = MovingObject;\n  window.Asteroid = Asteroid;\n  window.GameView = GameView;\n  window.Util = Util;\n  const canvasEl = document.getElementById(\"game-canvas\");\n  const ctx = canvasEl.getContext(\"2d\");\n  window.ctx = ctx;\n  new GameView(ctx).start()\n});\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nfunction MovingObject(options){\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game\n}\n\nconst mo = new MovingObject({\n  pos: [30, 30],\n  vel: [10, 10],\n  radius: 5,\n  color: \"#00FF00\"\n});\n\nMovingObject.prototype.draw = function (ctx) {\n  // console.log(ctx)\n  // console.log(this)\n\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.game.wrap(this.pos);\n}\n\nmodule.exports = MovingObject;\n\n\n// var c = document.getElementById(\"myCanvas\");\n// var ctx = c.getContext(\"2d\");\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n  childClass.prototype = Object.create(parentClass.prototype);\n  childClass.prototype.constructor = childClass;\n  }, \n  \n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Return a randomly oriented vector with the given length.\n\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n  // Scale the length of a vector by the given amount.\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });