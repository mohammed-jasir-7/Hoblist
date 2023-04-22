import 'package:geeks/models/user_credential.dart';
import 'package:injectable/injectable.dart';

abstract class AuthService {
  Future dbInit();
  Future addDataToDb({required UserCredential credential});
  Future passwordValidation(
      {required String userName, required String password});
}
