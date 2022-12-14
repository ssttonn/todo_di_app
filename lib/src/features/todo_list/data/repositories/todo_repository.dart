import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/datasources/todo_remote_datasource.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

import '../../presentation/models/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchAllTodos();
  Future<Todo> addNewTodo(String title);
  Future<Todo> updateTodo(Todo todo);
  Future<void> deleteTodo(String todoId);
}

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final BaseTodoRemoteDataSource _todoRemoteDataSource;
  TodoRepositoryImpl(@injectable this._todoRemoteDataSource);

  @override
  Future<Todo> addNewTodo(String title) {
    return _todoRemoteDataSource
        .addNewTodo(title)
        .then((model) => model.toTodo());
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    return _todoRemoteDataSource
        .updateTodo(todo.toTodoModel())
        .then((model) => model.toTodo());
  }

  @override
  Future<List<Todo>> fetchAllTodos() async {
    List<TodoModel> allTodoModels = await _todoRemoteDataSource.fetchAllTodos();
    return allTodoModels.map((model) => model.toTodo()).toList();
  }

  @override
  Future<void> deleteTodo(String todoId) {
    return _todoRemoteDataSource.deleteTodo(todoId);
  }
}
