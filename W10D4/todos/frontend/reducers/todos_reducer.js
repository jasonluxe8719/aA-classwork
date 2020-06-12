import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';


const initialState =
{
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
}

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const todosState = {};
  const todoState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_TODOS:
      // return action.todos;
      action.todos.forEach(todo => {
        todosState[todo.id] = todo;
      })
      return todosState;
    case RECEIVE_TODO: 
      todoState[action.todo.id] = action.todo;
      return todoState;
    default:
      return state;
  }
};

export default todosReducer;