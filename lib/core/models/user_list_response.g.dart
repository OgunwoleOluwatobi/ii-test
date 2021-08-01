// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserListAdapter extends TypeAdapter<UserListResponse> {
  @override
  final int typeId = 0;

  @override
  UserListResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserListResponse(
      users: (fields[0] as List?)?.cast<User>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserListResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
