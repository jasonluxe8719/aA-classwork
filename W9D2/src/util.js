const Util = {
  inherits(childClass, parentClass) {
  childClass.prototype = Object.create(parentClass.prototype);
  childClass.prototype.constructor = childClass;
  }, 
  
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Return a randomly oriented vector with the given length.

  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
  // Scale the length of a vector by the given amount.
};

module.exports = Util;
