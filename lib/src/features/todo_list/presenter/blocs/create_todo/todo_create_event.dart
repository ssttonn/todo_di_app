class TodoCreateEvent {}

class AddNewTodo extends TodoCreateEvent {
  final String newTodoTitle;
  AddNewTodo({required this.newTodoTitle});
}
