import 'package:todo_app/src/helpers/base_model.dart';
import 'package:todo_app/src/helpers/converters.dart';

import '../../presentation/models/todo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends BaseModel {
  @JsonKey(toJson: null)
  final String id;
  final String title;
  @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
  final DateTime? favoriteAt;
  @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
  final DateTime? finishAt;

  TodoModel(
      {required this.id, required this.title, this.favoriteAt, this.finishAt});

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  @override
  List<Object?> get props => [id];
}

extension TodoModelExtension on TodoModel {
  Todo toTodo() {
    return Todo(title: title, id: id, favoriteAt: favoriteAt);
  }
}
