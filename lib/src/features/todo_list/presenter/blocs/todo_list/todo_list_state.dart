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
  final TodoState state;

  TodoListState({required this.allTodos, required this.state});

  factory TodoListState.initial() {
    return TodoListState(allTodos: [], state: TodoState.initial);
  }

  TodoListState copyWith({List<TodoModel>? allTodos, TodoState? state}) {
    return TodoListState(
        allTodos: allTodos ?? this.allTodos, state: state ?? this.state);
  }
}
