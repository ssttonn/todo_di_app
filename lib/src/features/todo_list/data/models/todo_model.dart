import 'package:todo_app/src/helpers/base_model.dart';

class TodoModel implements BaseModel {
  final int id;
  final String title;
  DateTime? favoriteAt;

  TodoModel({required this.id, required this.title, this.favoriteAt});
}
