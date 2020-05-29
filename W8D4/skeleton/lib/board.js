let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = [];
  for(let i = 0; i < 8; i++) {
    let row = new Array(8);
    grid.push(row);
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8);
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
//
  if (!this.isValidPos(pos)) {
    throw new Error('carrots');
  } else {
    return this.grid[pos[0]][pos[1]];
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);

  return piece && (piece.color === color);
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
// *if position not valid
// I want to retrun piecesToFlip array when I meet myself, or hit empty space
// ----
// pos [0,3] color 1  dir [0, -1] 
//  [1] [0] [0] [ ] ]->   piecesToFlip [[0,2],[0,1]] 
//  [ ] [ ] [ ] [ ]
//  [ ] [ ] [ ] [ ]
//  [ ] [ ] [ ] [ ]

Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
   if (!piecesToFlip) 
   { piecesToFlip = []; 
  } else {
    piecesToFlip.push(pos);
  }
  let nextPosition = [pos[0] + dir[0], pos[1] + dir[1]]

  if (!this.isValidPos(nextPosition)) {
    return [];
  } else if(!this.isOccupied(nextPosition)) {
    return [];
  } else if (this.isMine(nextPosition, color)) {
    if (piecesToFlip.length > 0) {
      return piecesToFlip; 
    } else {
        return [];
      }
  } else {
    return this._positionsToFlip(nextPosition, color, dir, piecesToFlip);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) { 
  if (this.isOccupied(pos)) { return false; }

  for (let i = 0; i < Board.DIRS.length; i++){
    let result = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if (result.length > 0) {
      return true;
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
*/
Board.prototype.placePiece = function(pos, color) {
  if(!this.validMove(pos, color)) {
    throw new Error('this is error message');
  }

  let positions = [];

  for(let i = 0; i < Board.DIRS.length; i++) {
    //console.log(this._positionsToFlip(pos, color, Board.DIRS[i]));
    positions = positions.concat(this._positionsToFlip(pos, color, Board.DIRS[i]));
    //console.log(positions);
  }

  //console.log(positions);
  if (positions.length > 0) {
    for (let j = 0; j < positions.length; j++) {
      this.getPiece(positions[j]).flip();
    }
  }

  this.grid[pos[0]][pos[1]] = new Piece(color);
};


/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let valPos = [];
  
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i, j], color)){
        valPos.push([i,j]);
      }
    }
  }
  return valPos;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0;
};


/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") && !this.hasMove("black");
};


/**
 * Prints a string representation of the Board to the console.
 */

Board.prototype.print = function () {
  console.log("   0  1  2  3  4  5  6  7");
  let line = ""
  for (let i = 0; i < this.grid.length; i++) {

    line = ""
    for (let j = 0; j < this.grid.length; j++) {
      if (this.getPiece([i,j])){ 
        line = line.concat(this.getPiece([i,j]).toString());
      } else {
        line = line.concat(" _ ");
      }
    }


// console.log(str1.concat(' ', str2));
// // expected output: "Hello World"

    console.log(`${i}`.concat(' ',line));
    //console.log(line);
    //line = line.concat(.write("\n"));
  }
  
};



module.exports = Board;
