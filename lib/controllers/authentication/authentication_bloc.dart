import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeks/models/user_credential.dart';
import 'package:geeks/services/auth_services.dart';
import 'package:geeks/services/repo/db_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@Injectable()
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService;
  AuthenticationBloc(this.authService) : super(AuthenticationInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(LoadingState());
      final result = await authService.addDataToDb(
          credential: UserCredential(
              userName: event.userName,
              email: event.email,
              phone: event.phone,
              password: event.password));

      if (!result) {
        emit(const ErrorState(message: "username already exist!"));
      } else {
        emit(SignedState());
      }
    });
    on<LoadLogScreenEvent>((event, emit) => emit(LoadScreenState()));
    on<LoginEvent>((event, emit) async {
      try {
        final result = await authService.passwordValidation(
            userName: event.name, password: event.password);
        if (result) {
          emit(LoggedState());
        }
      } on LoginException catch (e) {
        emit(ErrorState(message: e.msg));
      }
    });
  }
}
