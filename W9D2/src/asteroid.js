// import MovingObject from './moving_object';
// import Util from './util';
const MovingObject = require("./moving_object");
const Util = require("./util");

const AST_CONST = {
  COLOR: 'black',
  RADIUS: 25
}

function Asteroid (options) {
    options.vel = Util.randomVec(10);
    options.color = AST_CONST.COLOR;
    options.radius = AST_CONST.RADIUS;
  
    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;

