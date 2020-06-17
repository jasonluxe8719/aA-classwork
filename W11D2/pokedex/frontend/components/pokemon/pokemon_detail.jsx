import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';



class PokemonDetail extends React.Component {
    componentDidMount() {
        this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    }

    componentDidUpdate(prevProps) {
      if(prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
        this.props.requestSinglePokemon(this.props.match.params.pokemonId);
      }
    }

    render() {
        const Item = ({item}) => {
            return (
                <div>
                    <img src={item.image_url}/>
                </div>
            )
        }
        let pokemon = this.props.pokemon
        if(!pokemon) return null;
        if(!pokemon.moves) return null;

        let items = this.props.items //possibly pokemon.items
   
        return (
            <div className="pokemon-detail">
                <img src={pokemon.image_url} alt={pokemon.name}/>
                <ul>
                    <li>{pokemon.name}</li>    
                    <li>Type: {pokemon.poke_type}</li>   
                    <li>Attack: {pokemon.attack}</li>   
                    <li>Defense: {pokemon.defense}</li>   
                    <li>Moves: {pokemon.moves.join(", ")}</li>  
                </ul>
                <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
            </div>
        )
    }
}

export default PokemonDetail;