const Asteroid = require('./asteroid');

const GAME_CONSTANTS = {
  DIM_X: 500,
  DIM_Y: 500,
  NUM_ASTEROIDS: 3
}

function Game () {
  this.dim_x = GAME_CONSTANTS.DIM_X;
  this.dim_y = GAME_CONSTANTS.DIM_Y;
  this.num_asteroids = GAME_CONSTANTS.NUM_ASTEROIDS;
  this.asteroids = [];

  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < GAME_CONSTANTS.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}));
  }
}

Game.prototype.randomPosition = function() {
  let x = Math.floor((Math.random() * GAME_CONSTANTS.DIM_X));
  let y = Math.floor((Math.random() * GAME_CONSTANTS.DIM_Y));

  return [x, y];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, GAME_CONSTANTS.DIM_X, GAME_CONSTANTS.DIM_Y);
  this.asteroids.forEach( function(asteroid) {
    asteroid.draw(ctx);
  })
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach( function(asteroid) {
    asteroid.move();
  })
}

Game.prototype.wrap = function (pos) {
    if(pos[0] < 0) {
      pos[0] = GAME_CONSTANTS.DIM_X;
     } else if(pos[0] > GAME_CONSTANTS.DIM_X) {
      pos[0] = 0;
     } else if(pos[1] < 0) {
       pos[1] = GAME_CONSTANTS.DIM_Y;
     } else if(pos[1] > GAME_CONSTANTS.DIM_Y) {
       pos[1] = 0;
     }
  }
  
  
  //iterate through all asteroids
  //check pos components to see if <= 0 or >= max
  //  if so invert component which is maxing or mining out => (200, 515)


module.exports = Game;
