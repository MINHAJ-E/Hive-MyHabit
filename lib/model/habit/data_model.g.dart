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
      category: fields[2] as String,
      feedback: fields[3] as String,
      taskcomplete: fields[4] as bool,
      startdate: fields[5] as String,
      enddate: fields[6] as String,
      date: fields[7] as DateTime,
      isregular: fields[8] as bool,
      dateregular: fields[9] as DateTime?,
    )..id = fields[10] as int?;
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.habit)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.feedback)
      ..writeByte(4)
      ..write(obj.taskcomplete)
      ..writeByte(5)
      ..write(obj.startdate)
      ..writeByte(6)
      ..write(obj.enddate)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.isregular)
      ..writeByte(9)
      ..write(obj.dateregular)
      ..writeByte(10)
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
