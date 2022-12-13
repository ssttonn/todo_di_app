import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/helpers/converters.dart';

import '../../presentation/models/todo.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel(
      {required String id,
      required String title,
      // ignore: invalid_annotation_target
      @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
          DateTime? favoriteAt,
      // ignore: invalid_annotation_target
      @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
          DateTime? finishedAt}) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

extension TodoModelExtension on TodoModel {
  Todo toTodo() {
    return Todo(title: title, id: id, favoriteAt: favoriteAt);
  }
}
