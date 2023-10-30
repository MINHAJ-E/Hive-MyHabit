// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitModelAdapter extends TypeAdapter<HabitModel> {
  @override
  final int typeId = 0;

  @override
  HabitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitModel(
      habit: fields[0] as String,
      note: fields[1] as String,
      taskcomplete: fields[2] as bool,
      lastUpdatedDate: fields[3] as String,
    )..id = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.habit)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.taskcomplete)
      ..writeByte(3)
      ..write(obj.lastUpdatedDate)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
