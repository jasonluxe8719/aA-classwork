const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

window.addEventListener('DOMContentLoaded', () => {
  window.Game = Game;
  window.MovingObject = MovingObject;
  window.Asteroid = Asteroid;
  window.GameView = GameView;
  window.Util = Util;
  const canvasEl = document.getElementById("game-canvas");
  const ctx = canvasEl.getContext("2d");
  window.ctx = ctx;
  new GameView(ctx).start()
});

