import * as SessionAPIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveCurrentUser = currentUser => {
  debugger
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser
  }
}

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});

const receiveErrors = errors => {
  return {
  type: RECEIVE_SESSION_ERRORS,
  errors
  }
};


export const login = user => dispatch => {
  return SessionAPIUtil.login(user).then((user) => dispatch(receiveCurrentUser(user)),(err) => dispatch(receiveErrors(err.responseJSON)));
  
}


export const logout = () => dispatch => (
  SessionAPIUtil.logout().then(() => dispatch(logoutCurrentUser()))
    .fail((err) => dispatch(receiveErrors(err.responseJSON)))
)

export const signup = user => dispatch => (
  SessionAPIUtil.signup(user).then((user) => dispatch(receiverCurrentUser(user)))
    .fail((err) => dispatch(receiveErrors(err.responseJSON)))
)