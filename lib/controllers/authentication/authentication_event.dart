part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthenticationEvent {
  final String userName;
  final String email;
  final String phone;
  final String password;
  const SignUpEvent(
      {required this.userName,
      required this.email,
      required this.phone,
      required this.password});

  @override
  List<Object> get props => [userName, email, phone, password];
}

class SignUpScreenChange extends AuthenticationEvent {}

class LoadLogScreenEvent extends AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String name;
  final String password;

  const LoginEvent({required this.name, required this.password});
}
