abstract class TodoListEvent {}

class FetchAllTodos extends TodoListEvent {}

class AddNewTodo extends TodoListEvent {
  final String newTodoTitle;
  AddNewTodo({required this.newTodoTitle});
}
