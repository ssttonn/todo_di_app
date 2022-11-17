abstract class TodoListEvent {}

class FetchAllTodos extends TodoListEvent {}

class ListenToAllTodosChanged extends TodoListEvent {}

class FavoriteTodo extends TodoListEvent {
  final int todoId;
  FavoriteTodo({required this.todoId});
}
