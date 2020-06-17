import React from 'react';
import { Link } from "react-router-dom";

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props)
    // this.state = { toggle: false }

  }

  render() {
    return (
      <div>
        <ul>
            <Link to={`/pokemon/${this.props.pokemon.id}`}>
                <li>{this.props.pokemon.name}</li>
                <li>
                    <img src={this.props.pokemon.image_url} alt={this.props.pokemon.name}/>
                    </li>
            </Link>
        </ul>
        
      </div>
    )
  }

}

export default PokemonIndexItem;