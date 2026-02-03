// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_list_progress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoListProgressAdapter extends TypeAdapter<ToDoListProgress> {
  @override
  final int typeId = 3;

  @override
  ToDoListProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoListProgress(
      name: fields[0] as String,
      isDone: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoListProgress obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoListProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
