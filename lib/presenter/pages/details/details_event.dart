part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class SaveDetailsRequestEvent extends DetailsEvent {
  final ImageEntity image;
  const SaveDetailsRequestEvent({
    required this.image,
  });

  @override
  List<Object> get props => [
        image,
      ];
}
