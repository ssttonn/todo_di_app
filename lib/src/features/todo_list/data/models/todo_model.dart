import 'package:todo_app/src/helpers/base_model.dart';

class TodoModel implements BaseModel {
  final int id;
  final String title;
  bool isFavorite;

  TodoModel({required this.id, required this.title, this.isFavorite = false});
}
