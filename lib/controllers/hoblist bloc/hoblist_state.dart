part of 'hoblist_bloc.dart';

abstract class HoblistState extends Equatable {
  const HoblistState();

  @override
  List<Object?> get props => [];
}

class HoblistInitial extends HoblistState {}

class LoadingState extends HoblistState {}

class ErrorState extends HoblistState {}

class NetWorkState extends HoblistState {}

class ProvideData extends HoblistState {
  final List<Result>? movieList;

  const ProvideData({required this.movieList});
  @override
  List<Object?> get props => [movieList];
}
