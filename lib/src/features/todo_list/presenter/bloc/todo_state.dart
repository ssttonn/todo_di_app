import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

class TodoState {
  final bool isFetchingTodos;
  final bool isAddingNewTodo;
  final List<TodoModel> allTodos;
  final bool forceRerender;
  final String? errorMessage;
  List<TodoModel> get favoriteTodos =>
      allTodos.where((element) => element.isFavorite).toList();

  TodoState(
      {this.isFetchingTodos = false,
      this.isAddingNewTodo = false,
      this.forceRerender = false,
      this.allTodos = const [],
      this.errorMessage});

  TodoState copyWith(
      {bool? isFetchingTodos,
      bool? isAddingNewTodo,
      bool? forceRerender,
      List<TodoModel>? allTodos,
      String? errorMessage}) {
    return TodoState(
        isFetchingTodos: isFetchingTodos ?? this.isFetchingTodos,
        isAddingNewTodo: isAddingNewTodo ?? this.isAddingNewTodo,
        allTodos: allTodos ?? this.allTodos,
        errorMessage: errorMessage ?? "",
        forceRerender: forceRerender ?? this.forceRerender);
  }
}
