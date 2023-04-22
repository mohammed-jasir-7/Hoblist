// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credential.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCredentialAdapter extends TypeAdapter<UserCredential> {
  @override
  final int typeId = 1;

  @override
  UserCredential read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCredential(
      userName: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String,
      password: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserCredential obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
