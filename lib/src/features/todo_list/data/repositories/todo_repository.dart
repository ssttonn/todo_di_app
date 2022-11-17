import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/helpers/base_model.dart';

import '../datasources/todo_local_datasource.dart';

abstract class TodoRepository<T extends BaseModel> {
  Future<List<T>> fetchAllTodos();
  Future<T> addNewTodo(String title);
  Future<T> favoriteTodo(int todoId);
}

@Injectable(as: TodoRepository<TodoModel>)
class TodoRepositoryImpl implements TodoRepository<TodoModel> {
  final TodoLocalDataSource<TodoEntity> _dataSource;
  TodoRepositoryImpl(@injectable this._dataSource);

  @override
  Future<TodoModel> addNewTodo(String title) {
    return _dataSource.addNewTodo(title).then((entity) => entity.toModel());
  }

  @override
  Future<TodoModel> favoriteTodo(int todoId) {
    return _dataSource.favoriteTodo(todoId).then((entity) => entity.toModel());
  }

  @override
  Future<List<TodoModel>> fetchAllTodos() async {
    List<TodoEntity> allTodoEntities = await _dataSource.fetchAllTodos();
    return allTodoEntities.map((entity) => entity.toModel()).toList();
  }
}
