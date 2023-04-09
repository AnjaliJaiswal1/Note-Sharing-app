// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileDataHiveAdapter extends TypeAdapter<UserProfileDataHive> {
  @override
  final int typeId = 1;

  @override
  UserProfileDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileDataHive();
  }

  @override
  void write(BinaryWriter writer, UserProfileDataHive obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileDataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
