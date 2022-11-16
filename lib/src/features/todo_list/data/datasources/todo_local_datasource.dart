import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoHiveEntity>> fetchAllTodos();
  Future<TodoHiveEntity> addNewTodo(String title);
  Future<void> favoriteTodo(int todoId);
}

@LazySingleton(as: TodoLocalDataSource)
class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Box<TodoHiveEntity> hiveBox;
  TodoLocalDataSourceImpl({@injectable required this.hiveBox});

  @override
  Future<TodoHiveEntity> addNewTodo(String title) {
    TodoHiveEntity _newEntity =
        TodoHiveEntity(id: 0, title: title, isFavorite: false);
    return hiveBox.add(_newEntity).then((id) => _newEntity.copyWith(id: id));
  }

  @override
  Future<void> favoriteTodo(int todoId) async {
    TodoHiveEntity? _selectedEntity = hiveBox.getAt(todoId);
    if (_selectedEntity == null) return;
    _selectedEntity.isFavorite = !_selectedEntity.isFavorite;
    return _selectedEntity.save();
  }

  @override
  Future<List<TodoHiveEntity>> fetchAllTodos() async {
    return hiveBox.keys
        .map((id) => hiveBox.getAt(id)!.copyWith(id: id))
        .toList();
  }
}
