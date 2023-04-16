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
    return UserProfileDataHive(
      profile_image: fields[0] as String?,
      id: fields[1] as int?,
      gender: fields[2] as String?,
      description: fields[3] as String?,
      university: fields[4] as String?,
      course: fields[5] as String?,
      collegeID: fields[6] as String?,
      user: fields[7] as int?,
      year: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileDataHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.profile_image)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.university)
      ..writeByte(5)
      ..write(obj.course)
      ..writeByte(6)
      ..write(obj.collegeID)
      ..writeByte(7)
      ..write(obj.user)
      ..writeByte(8)
      ..write(obj.year);
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
