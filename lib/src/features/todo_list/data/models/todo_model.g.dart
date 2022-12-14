// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      favoriteAt: dateTimeFromMillis(json['favorite_at'] as int?),
      finishAt: dateTimeFromMillis(json['finish_at'] as int?),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'favorite_at': instance.favoriteAt?.toIso8601String(),
      'finish_at': instance.finishAt?.toIso8601String(),
    };
