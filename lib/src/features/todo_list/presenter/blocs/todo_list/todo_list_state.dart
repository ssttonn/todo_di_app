import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

enum TodoState {
  initial,
  fetchingTodos,
  fetchTodosSuccess,
  addingNewTodo,
  newTodoAdded,
  todoBeingFavorite,
  todoFavorited,
  failure
}

class TodoListState {
  final List<TodoModel> allTodos;
  final List<TodoModel> favoriteTodos;
  final TodoState state;

  TodoListState(
      {required this.allTodos,
      required this.state,
      required this.favoriteTodos});

  factory TodoListState.initial() {
    return TodoListState(
        allTodos: [], favoriteTodos: [], state: TodoState.initial);
  }

  TodoListState copyWith(
      {List<TodoModel>? allTodos,
      List<TodoModel>? favoriteTodos,
      TodoState? state}) {
    return TodoListState(
        allTodos: allTodos ?? this.allTodos,
        favoriteTodos: favoriteTodos ?? this.favoriteTodos,
        state: state ?? this.state);
  }
}
