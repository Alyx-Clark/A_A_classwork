import React from "react";
import TodoListItem from "../todo_list/todo_list_item";

// const TodoList = (props) => {
//   return <h3>Todo List goes here!</h3>;
// };

const TodoList = (props) => {
  return (
    <div>
      <ul>
        {props.todos.map((todo) => (
          <TodoListItem todo={todo} />
        ))}
      </ul>
      {/* <TeaForm receiveTea={props.receiveTea} />
          <h3>Green Teas: </h3>
          <ul>
              {
                  props.greenTeas.map(tea => <li key={tea.id}>{tea.flavor}</li>)
              }
          </ul> */}
    </div>
  );
};

export default TodoList;

// const initialState = {
//     todos: {
//         1: {
//             id: 1,
//             title: "wash car",
//             body: "with soap",
//             done: false
//         },
//         2: {
//             id: 2,
//             title: "wash dog",
//             body: "with shampoo",
//             done: true
//         }
//     }
// };

// state.todos.1.title //wash car
