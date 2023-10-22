// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IMCRecordAdapter extends TypeAdapter<IMCRecord> {
  @override
  final int typeId = 0;

  @override
  IMCRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IMCRecord(
      weight: fields[0] as double,
      imc: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, IMCRecord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.imc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IMCRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
