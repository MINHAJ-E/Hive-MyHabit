// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regular_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegularModelAdapter extends TypeAdapter<RegularModel> {
  @override
  final int typeId = 1;

  @override
  RegularModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegularModel(
      regular: fields[0] as String,
      note: fields[1] as String,
      isDone: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RegularModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.regular)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegularModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
