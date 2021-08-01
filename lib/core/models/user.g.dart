// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      title: fields[1] as String?,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      gender: fields[4] as String?,
      email: fields[5] as String?,
      dateOfBirth: fields[6] as String?,
      phone: fields[7] as String?,
      picture: fields[8] as String?,
      location: fields[9] as Location?,
      registerDate: fields[10] as String?,
      updatedAt: fields[11] as String?,
      loaded: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.picture)
      ..writeByte(9)
      ..write(obj.location)
      ..writeByte(10)
      ..write(obj.registerDate)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.loaded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
