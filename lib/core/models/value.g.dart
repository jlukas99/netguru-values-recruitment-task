// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ValueModelAdapter extends TypeAdapter<ValueModel> {
  @override
  final int typeId = 0;

  @override
  ValueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ValueModel(
      fields[0] as String,
      isFavorite: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ValueModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
