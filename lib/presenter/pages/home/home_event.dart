part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeRequestEvent extends HomeEvent {
  const HomeRequestEvent();

  @override
  List<Object> get props => [];
}
