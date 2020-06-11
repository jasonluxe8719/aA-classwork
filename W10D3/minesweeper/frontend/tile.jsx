import React from 'react';
// import * as Minesweeper from '../minesweeper';


export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    
    let flagged = null;
    if (event.altKey) {
      flagged = true; 
    } else {
      flagged = false;
    }

    this.props.updateGame(this.props.tile, flagged)
  }

  render() {
    const tile = this.props.tile;
    let status = null;
    let msg = " ";
    if(tile.explored) {
      if(tile.bombed) {
        status = "bombed";
        msg = "You lost!";
      } else {
        status = "explored";
      }
    } else if(tile.flagged) {
      status = "flagged";
    }
    // console.log(tile);
    // debugger
    return(
        <div className="outer">
          <div className={status} onClick={this.handleClick}>
          {"T"}
          </div>
        </div>
    );
  }


}