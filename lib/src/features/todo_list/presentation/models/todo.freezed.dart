// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Todo {
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  DateTime? get favoriteAt => throw _privateConstructorUsedError;
  set favoriteAt(DateTime? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res, Todo>;
  @useResult
  $Res call({String title, String id, DateTime? favoriteAt});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res, $Val extends Todo>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? favoriteAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteAt: freezed == favoriteAt
          ? _value.favoriteAt
          : favoriteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodolCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodolCopyWith(_$_Todol value, $Res Function(_$_Todol) then) =
      __$$_TodolCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String id, DateTime? favoriteAt});
}

/// @nodoc
class __$$_TodolCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res, _$_Todol>
    implements _$$_TodolCopyWith<$Res> {
  __$$_TodolCopyWithImpl(_$_Todol _value, $Res Function(_$_Todol) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? favoriteAt = freezed,
  }) {
    return _then(_$_Todol(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteAt: freezed == favoriteAt
          ? _value.favoriteAt
          : favoriteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_Todol implements _Todol {
  _$_Todol({required this.title, required this.id, this.favoriteAt});

  @override
  String title;
  @override
  String id;
  @override
  DateTime? favoriteAt;

  @override
  String toString() {
    return 'Todo(title: $title, id: $id, favoriteAt: $favoriteAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodolCopyWith<_$_Todol> get copyWith =>
      __$$_TodolCopyWithImpl<_$_Todol>(this, _$identity);
}

abstract class _Todol implements Todo {
  factory _Todol(
      {required String title,
      required String id,
      DateTime? favoriteAt}) = _$_Todol;

  @override
  String get title;
  set title(String value);
  @override
  String get id;
  set id(String value);
  @override
  DateTime? get favoriteAt;
  set favoriteAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$_TodolCopyWith<_$_Todol> get copyWith =>
      throw _privateConstructorUsedError;
}
