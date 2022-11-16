// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoHiveEntityAdapter extends TypeAdapter<TodoHiveEntity> {
  @override
  final int typeId = 0;

  @override
  TodoHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoHiveEntity(
      id: fields[0] == null ? 0 : fields[0] as int,
      title: fields[1] == null ? '' : fields[1] as String,
      isFavorite: fields[2] == null ? false : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoHiveEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
