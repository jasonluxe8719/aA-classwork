import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { getItems } from '../../reducers/selectors';


const mapStateToProps = (state, ownProps) => {
  // piece of state that container subscribes to

  return {
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
  }
  // items: getItems(state, ownProps.pokemonId)
};

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (pokemonId) => {
    return dispatch(requestSinglePokemon(pokemonId))
  }
  // dispatch requestAllPokemon action.
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

