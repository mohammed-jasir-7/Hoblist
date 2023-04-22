import 'package:hive_flutter/adapters.dart';
part 'user_credential.g.dart';

@HiveType(typeId: 1)
class UserCredential extends HiveObject {
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String password;

  UserCredential(
      {required this.userName,
      required this.email,
      required this.phone,
      required this.password});
}
