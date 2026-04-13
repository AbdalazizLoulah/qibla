// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasbeeh_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasbeehModelAdapter extends TypeAdapter<TasbeehModel> {
  @override
  final int typeId = 0;

  @override
  TasbeehModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasbeehModel(
      do3a: fields[0] as String,
      current: fields[1] as int,
      round: fields[2] as int,
      total: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TasbeehModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.do3a)
      ..writeByte(1)
      ..write(obj.current)
      ..writeByte(2)
      ..write(obj.round)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasbeehModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
