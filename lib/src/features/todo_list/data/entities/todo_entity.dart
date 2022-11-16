import 'package:hive/hive.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/helpers/base_entity.dart';

part 'todo_entity.g.dart';

@HiveType(typeId: 0)
class TodoHiveEntity extends HiveObject implements BaseEntity<TodoModel> {
  @HiveField(0, defaultValue: 0)
  int id;
  @HiveField(1, defaultValue: "")
  String title;
  @HiveField(2, defaultValue: false)
  bool isFavorite;

  TodoHiveEntity(
      {required this.id, required this.title, required this.isFavorite});

  @override
  TodoModel toModel() {
    return TodoModel(id: id, title: title, isFavorite: isFavorite);
  }

  TodoHiveEntity copyWith({int? id, String? title, bool? isFavorite}) {
    return TodoHiveEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
