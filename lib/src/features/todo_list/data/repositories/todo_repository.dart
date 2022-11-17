import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/helpers/base_model.dart';

import '../datasources/todo_local_datasource.dart';

abstract class TodoRepository<T extends BaseModel> {
  Future<List<T>> fetchAllTodos();
  Future<void> addNewTodo(String title);
  Future<void> favoriteTodo(int todoId);
  Future<Stream<TodoModel>> todoChanged();
}

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository<TodoModel> {
  final TodoLocalDataSource<TodoHiveEntity> _dataSource;
  final Box<TodoHiveEntity> hiveBox;
  TodoRepositoryImpl(@injectable this._dataSource, @injectable this.hiveBox);

  @override
  Future<void> addNewTodo(String title) async {
    return _dataSource.addNewTodo(title);
  }

  @override
  Future<void> favoriteTodo(int todoId) {
    return _dataSource.favoriteTodo(todoId);
  }

  @override
  Future<List<TodoModel>> fetchAllTodos() async {
    List<TodoHiveEntity> allTodoEntities = await _dataSource.fetchAllTodos();
    return allTodoEntities.map((entity) => entity.toModel()).toList();
  }

  @override
  Future<Stream<TodoModel>> todoChanged() async {
    return hiveBox.watch().map((event) =>
        (event.value as TodoHiveEntity).copyWith(id: event.key).toModel());
  }
}
