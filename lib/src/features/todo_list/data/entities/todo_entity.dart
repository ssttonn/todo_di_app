import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/helpers/base_entity.dart';

class TodoEntity implements BaseEntity<TodoModel> {
  final int id;
  final String title;
  bool isFavorite;
  TodoEntity({required this.id, required this.title, required this.isFavorite});

  @override
  TodoModel toModel() {
    return TodoModel(id: id, title: title, isFavorite: isFavorite);
  }
}
