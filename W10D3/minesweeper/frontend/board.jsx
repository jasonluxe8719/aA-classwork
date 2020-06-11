import React from 'react';
import Tile from './tile';


export default class Board extends React.Component {
  constructor(props){
    super(props);

  }

  render() {
    return this.props.board.grid.map( (row, idx) => {
        return(
          <div className="row" key={idx}>
              {row.map( (tile, index) => {
                  return (<Tile tile={tile} updateGame={this.props.updateGame} key={index} />)
               })}
          </div>
        );
      });
  }


}