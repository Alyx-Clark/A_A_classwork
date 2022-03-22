


const allTodos = (state) => {
    const newTodosArray = Object.values(state.todos);
    return newTodosArray;
};

export default allTodos;

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