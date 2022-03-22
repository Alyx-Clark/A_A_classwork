import { RECEIVE_TODOS, RECEIVE_TODO } from "../actions/todo_actions";

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

// state.todos.1.title //wash car



// const todos = [{id: 3, title: "New Todo" }, {id: 4, title: "buy a new car"}];

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);


    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach((ele, idx) => {
                nextState[action.ele.id] = action.ele;
            });
            return nextState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState;
        default:
            return nextState;
    }
};

export default todosReducer;