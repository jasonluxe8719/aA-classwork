import * as APIUtil from '../utils/api_util';
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";


export const receiveAllPokemon = pokemon => {
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon
    }
}

export const receivePokemon = pokemon => {
    return {
        type: RECEIVE_POKEMON,
        pokemon: pokemon
    }
}



export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestSinglePokemon = (pokemonId) => {
    return (dispatch) => {
        return APIUtil.fetchPokemon(pokemonId)
        .then(pokemon => {
            dispatch(receivePokemon(pokemon));
            return pokemon;
        })
    }

}
