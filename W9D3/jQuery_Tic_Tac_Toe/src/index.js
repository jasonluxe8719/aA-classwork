const View = require('./ttt-view.js');
const Game = require('../../solution 6/game.js');

  $(() => {
    const game = new Game();
    const view = new View(game, $('.ttt'));
  });
