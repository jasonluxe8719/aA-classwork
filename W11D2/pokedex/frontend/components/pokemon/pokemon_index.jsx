import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import {Route} from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonList = Object.values(this.props.pokemon).map((pokemon) => {
      return (
        <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
      )
    })
    return(
      <div className="pokemon-list">
        <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        {pokemonList}

      </div>
    )
  }
}

export default PokemonIndex;