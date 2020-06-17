import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { HashRouter, Route } from "react-router-dom";

// import { receiveAllPokemon } from "./actions/pokemon_actions"
// import { fetchAllPokemon } from './utils/api_util' 
// import { requestAllPokemon } from "./actions/pokemon_actions";
// import { selectAllPokemon } from './reducers/selectors'
import Root from './components/root'


document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, rootEl);
  

  // window.getState = store.getState;
  // window.dispatch = store.dispatch;
  //   window.receiveAllPokemon = receiveAllPokemon;
  //   window.fetchAllPokemon = fetchAllPokemon;
  //   window.requestAllPokemon = requestAllPokemon;
  //   window.selectAllPokemon = selectAllPokemon;
});