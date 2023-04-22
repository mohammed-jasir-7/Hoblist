part of 'hoblist_bloc.dart';

abstract class HoblistEvent extends Equatable {
  const HoblistEvent();

  @override
  List<Object> get props => [];
}

class FetchMoviesEvent extends HoblistEvent {
  const FetchMoviesEvent();
}
