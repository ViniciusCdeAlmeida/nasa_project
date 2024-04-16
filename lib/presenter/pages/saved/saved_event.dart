part of 'saved_bloc.dart';

sealed class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class SavedRequestEvent extends SavedEvent {
  const SavedRequestEvent();

  @override
  List<Object> get props => [];
}
