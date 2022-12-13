// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
mixin _$TodoModel {
  String get id => throw _privateConstructorUsedError;
  String get title =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
  DateTime? get favoriteAt =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
  DateTime? get finishedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
          DateTime? favoriteAt,
      @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
          DateTime? finishedAt});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? favoriteAt = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteAt: freezed == favoriteAt
          ? _value.favoriteAt
          : favoriteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$$_TodoModelCopyWith(
          _$_TodoModel value, $Res Function(_$_TodoModel) then) =
      __$$_TodoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
          DateTime? favoriteAt,
      @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
          DateTime? finishedAt});
}

/// @nodoc
class __$$_TodoModelCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$_TodoModel>
    implements _$$_TodoModelCopyWith<$Res> {
  __$$_TodoModelCopyWithImpl(
      _$_TodoModel _value, $Res Function(_$_TodoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? favoriteAt = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_$_TodoModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteAt: freezed == favoriteAt
          ? _value.favoriteAt
          : favoriteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoModel implements _TodoModel {
  const _$_TodoModel(
      {required this.id,
      required this.title,
      @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
          this.favoriteAt,
      @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
          this.finishedAt});

  factory _$_TodoModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodoModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
  final DateTime? favoriteAt;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
  final DateTime? finishedAt;

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, favoriteAt: $favoriteAt, finishedAt: $finishedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.favoriteAt, favoriteAt) ||
                other.favoriteAt == favoriteAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, favoriteAt, finishedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoModelCopyWith<_$_TodoModel> get copyWith =>
      __$$_TodoModelCopyWithImpl<_$_TodoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoModelToJson(
      this,
    );
  }
}

abstract class _TodoModel implements TodoModel {
  const factory _TodoModel(
      {required final String id,
      required final String title,
      @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
          final DateTime? favoriteAt,
      @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
          final DateTime? finishedAt}) = _$_TodoModel;

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$_TodoModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "favorite_at", fromJson: dateTimeFromMillis)
  DateTime? get favoriteAt;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "finish_at", fromJson: dateTimeFromMillis)
  DateTime? get finishedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TodoModelCopyWith<_$_TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
