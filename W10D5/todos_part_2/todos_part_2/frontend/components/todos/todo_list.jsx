import React from 'react';
import TodoListItem from '../todo_list/todo_list_item'


const TodoList = (props) => {
  return (
    <ul className="todo-list">
      {props.todos.map((todo, idx) => 
        <TodoListItem 
          key={idx}
          todo={todo}
          // title={todo.title}
          />
      )}

    </ul>
  )
};

export default TodoList;

