import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);


  }

  render() {
    const title = this.props.todo.title;

    return (
      <li className="todo-list-item">{title}</li>
    )
  }
}

export default TodoListItem;