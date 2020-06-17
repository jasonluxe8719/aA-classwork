
export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}

// export const getItems = (state, pokemonId) => {
//   return Object.values(state.entities.pokemon.items).filter(item => item.pokemonId === pokemonId)
// }

export const selectPokemonItem = (state, itemId) => {
  return state.entities.items[itemId]
}