import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/datasources/todo_base_datasource.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';

@LazySingleton(as: TodoBaseDataSource)
class TodoLocalDataSource implements TodoBaseDataSource {
  final Box hiveBox;
  TodoLocalDataSource({@injectable required this.hiveBox});

  @override
  Future<TodoHiveEntity> addNewTodo(String title) {
    TodoHiveEntity _newEntity = TodoHiveEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        isFavorite: false);
    return hiveBox.add(_newEntity).then((_) => _newEntity);
  }

  @override
  Future<void> favoriteTodo(String todoId) {
    throw UnimplementedError();
  }

  @override
  Future<List<TodoHiveEntity>> fetchAllTodos() async {
    return [];
  }
}
