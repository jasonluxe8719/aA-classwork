import React from "react";
import ReactDOM from "react-dom";
import { login, logout, signup } from './actions/session_actions';
import configureStore from './store/store'
import Root from './components/root'


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();

  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);

  window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.login = login;
  window.logout = logout;
  window.signup = signup;
});