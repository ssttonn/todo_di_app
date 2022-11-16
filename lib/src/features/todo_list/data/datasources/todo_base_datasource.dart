import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';

abstract class TodoBaseDataSource {
  Future<List<TodoHiveEntity>> fetchAllTodos();
  Future<TodoHiveEntity> addNewTodo(String title);
  Future<void> favoriteTodo(String todoId);
}
