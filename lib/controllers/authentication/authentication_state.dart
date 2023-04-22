part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class SignedState extends AuthenticationState {}

class ErrorState extends AuthenticationState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class LoadScreenState extends AuthenticationState {}

class LoggedState extends AuthenticationState {}
