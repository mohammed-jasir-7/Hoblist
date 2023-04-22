import 'dart:developer';

import 'package:geeks/models/user_credential.dart';
import 'package:geeks/services/auth_services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthService)
class DbRepository extends AuthService {
  @override
  Future<void> dbInit() async {
    if (!Hive.isAdapterRegistered(UserCredentialAdapter().typeId)) {
      Hive.registerAdapter(UserCredentialAdapter());
    }
    await Hive.initFlutter();
    await Hive.openBox<UserCredential>('user');

    log("db created");
  }

  @override
  Future<bool> addDataToDb({required UserCredential credential}) async {
    final box = Hive.box<UserCredential>("user");
    for (var element in box.values.toList()) {
      log(" hhhhhh ${element.userName}");
      if (element.userName == credential.userName) {
        return false;
      }
    }
    box.add(credential);
    // final sharedpref = await SharedPreferences.getInstance();
    // await sharedpref.setString("isloged", credential.userName);

    return true;
  }

  @override
  Future<bool> passwordValidation(
      {required String userName, required String password}) async {
    final box = Hive.box<UserCredential>("user").values.toList();
    for (var element in box) {
      if (element.userName == userName) {
        if (element.password == password) {
          return true;
        } else {
          throw LoginException("incorrect password");
        }
      } else {
        throw LoginException("user not exist");
      }
    }
    throw LoginException("user not exist");
  }
}

class LoginException {
  final String msg;

  LoginException(this.msg);
}
