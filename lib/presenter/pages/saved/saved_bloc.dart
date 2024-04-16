import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/usecases/get_saved_image_usecase.dart';
import 'package:nasa_project/presenter/shared/app_state.dart';

part 'saved_event.dart';

class SavedBloc extends Bloc<SavedEvent, AppState<List<ImageEntity>>> {
  final GetSavedImageUsecase _getImageUsecase;

  SavedBloc({
    required GetSavedImageUsecase getImageUsecase,
  })  : _getImageUsecase = getImageUsecase,
        super(AppState.loading()) {
    on<SavedRequestEvent>((event, emit) async {
      await _getData(event, emit);
    });
    add(const SavedRequestEvent());
  }

  final initialDateNotifier = ValueNotifier<DateTime?>(null);
  final finalDateNotifier = ValueNotifier<DateTime?>(null);

  Future<void> _getData(SavedRequestEvent e, Emitter<AppState<List<ImageEntity>>> emit) async {
    emit(AppState<List<ImageEntity>>.loading());
    final data = await _getImageUsecase();
    emit(AppState<List<ImageEntity>>.success(data));
  }
}
