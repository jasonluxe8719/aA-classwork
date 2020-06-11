import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';
// import { Alert } from 'react-alert'

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {board: new Minesweeper.Board(8, 10)};

    this.updateGame = this.updateGame.bind(this);
  }


  updateGame(tile, flagged) {
    if (flagged) tile.toggleFlag();
    else tile.explore();

    this.setState({ board: this.state.board });
  }

  render(){
    let msg;

  // gameStatus() {
    if (this.state.board.lost()) {
      msg = "You lose!!!"
      // alert(msg)
    } else if (this.state.board.won()) {
      msg = 'You win!!!'
      // alert(msg)
    }

    return(
      <div>
        {msg}
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }

}