abstract class TodoListEvent {}

class FetchAllTodos extends TodoListEvent {}

class FavoriteTodo extends TodoListEvent {
  final String todoId;
  FavoriteTodo({required this.todoId});
}

class AddNewTodo extends TodoListEvent {
  final String newTodoTitle;
  AddNewTodo({required this.newTodoTitle});
}
