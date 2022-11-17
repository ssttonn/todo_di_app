import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';
import 'package:todo_app/src/helpers/base_entity.dart';
import 'package:collection/collection.dart';

abstract class TodoLocalDataSource<T extends BaseEntity> {
  Future<List<T>> fetchAllTodos();
  Future<T> addNewTodo(String title);
  Future<T> favoriteTodo(int todoId);
}

@Injectable(as: TodoLocalDataSource<TodoEntity>)
class TodoMockDataSourceImpl implements TodoLocalDataSource<TodoEntity> {
  @override
  Future<TodoEntity> addNewTodo(String title) {
    TodoEntity _newTodo = TodoEntity(
        id: _mockTodoEntities.length, title: title, isFavorite: false);
    _mockTodoEntities.insert(0, _newTodo);
    return Future.value(_newTodo);
  }

  @override
  Future<TodoEntity> favoriteTodo(int todoId) {
    TodoEntity? _todoEntity =
        _mockTodoEntities.firstWhereOrNull((element) => element.id == todoId);
    if (_todoEntity == null) throw "Unable to find this todo, please try again";
    _todoEntity.isFavorite = !_todoEntity.isFavorite;
    return Future.value(_todoEntity);
  }

  @override
  Future<List<TodoEntity>> fetchAllTodos() {
    return Future.value(_mockTodoEntities);
  }
}

List<TodoEntity> _mockTodoEntities = [];
