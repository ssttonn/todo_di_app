import 'package:hive/hive.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/helpers/base_entity.dart';

@HiveType(typeId: 0)
class TodoHiveEntity extends HiveObject implements BaseEntity<TodoModel> {
  @HiveField(0, defaultValue: "")
  final String id;
  @HiveField(1, defaultValue: "")
  final String title;
  @HiveField(2, defaultValue: false)
  final bool isFavorite;

  TodoHiveEntity(
      {required this.id, required this.title, required this.isFavorite});

  @override
  TodoModel toModel() {
    return TodoModel(id: id, title: title, isFavorite: isFavorite);
  }
}
