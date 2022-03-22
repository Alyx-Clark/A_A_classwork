import { connect } from "react-redux";
import TodoList from "./todo_list";
import { receiveTodo, receiveTodos } from "../../actions/todo_actions";
import allTodos from "../../reducers/selectors";

const mapStateToProps = (state) => ({
  todos: allTodos(state),
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
});

const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default TodoListContainer;
//  props
//  {k1:v1, k2:v2}
