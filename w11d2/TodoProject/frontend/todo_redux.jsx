import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
// import { receiveTodos, receiveTodo } from "./actions/todo_actions";
import Root from "./components/root";
import allTodos from "./reducers/selectors";
import * as TodoApiUtil from "./util/todo_api_util";

document.addEventListener("DOMContentLoaded", () => {
  const rootElement = document.getElementById("root");
  const store = configureStore();
  window.allTodos = allTodos;
  window.store = store;
  // window.receiveTodo = receiveTodo;
  // window.receiveTodos = receiveTodos;
  window.TodoApiUtil = TodoApiUtil;
  ReactDOM.render(<Root store={store} />, rootElement);
});
