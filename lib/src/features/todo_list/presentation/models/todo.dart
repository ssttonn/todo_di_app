import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

class Todo {
  final String id;
  final String title;
  final DateTime? favoriteAt;
  final DateTime? finishAt;

  Todo({required this.id, required this.title, this.favoriteAt, this.finishAt});
}

extension TodoExtension on Todo {
  TodoModel toTodoModel() {
    return TodoModel(
        id: id, title: title, favoriteAt: favoriteAt, finishAt: finishAt);
  }
}
