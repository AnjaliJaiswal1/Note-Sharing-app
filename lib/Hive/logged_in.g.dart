// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataHiveAdapter extends TypeAdapter<UserDataHive> {
  @override
  final int typeId = 0;

  @override
  UserDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataHive(
      id: fields[0] as int?,
      first_name: fields[1] as String?,
      last_name: fields[2] as String?,
      name: fields[3] as String?,
      email: fields[4] as String?,
      username: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.first_name)
      ..writeByte(2)
      ..write(obj.last_name)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
