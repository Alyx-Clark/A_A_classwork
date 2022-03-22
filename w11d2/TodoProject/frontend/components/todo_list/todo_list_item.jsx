import React from "react";
const TodoListItem = (props) => {
  return <li key={props.todo.id}>title: {props.todo.title}</li>;
};
export default TodoListItem;
