// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoModel _$$_TodoModelFromJson(Map<String, dynamic> json) => _$_TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      favoriteAt: dateTimeFromMillis(json['favorite_at'] as int?),
      finishedAt: dateTimeFromMillis(json['finish_at'] as int?),
    );

Map<String, dynamic> _$$_TodoModelToJson(_$_TodoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'favorite_at': instance.favoriteAt?.toIso8601String(),
      'finish_at': instance.finishedAt?.toIso8601String(),
    };
