// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ValueAdapter extends TypeAdapter<Value> {
  @override
  final int typeId = 0;

  @override
  Value read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Value(
      fields[0] as String,
      isFavorite: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Value obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
