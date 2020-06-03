const Game = require("./game"); //why two r's

function GameView (ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function () {
  let that = this;
  setInterval( function () {
    that.game.moveObjects();
    that.game.draw(that.ctx);
  },
    100);
}


module.exports = GameView;