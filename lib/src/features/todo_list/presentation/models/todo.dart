import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@unfreezed
class Todo with _$Todo {
  factory Todo(
      {required String title,
      required String id,
      DateTime? favoriteAt}) = _Todol;
}
