import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/usecases/get_image_usecase.dart';
import 'package:nasa_project/presenter/shared/app_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, AppState<List<ImageEntity>>> {
  final GetImageUsecase _getImageUsecase;

  HomeBloc({
    required GetImageUsecase getImageUsecase,
  })  : _getImageUsecase = getImageUsecase,
        super(AppState.init()) {
    on<HomeRequestEvent>((event, emit) async {
      await _getData(event, emit);
    });
  }

  final initialDateNotifier = ValueNotifier<DateTime?>(null);
  final finalDateNotifier = ValueNotifier<DateTime?>(null);

  Future<void> _getData(HomeRequestEvent e, Emitter<AppState<List<ImageEntity>>> emit) async {
    emit(AppState<List<ImageEntity>>.loading());
    final data = await _getImageUsecase(
        initialDate:
            initialDateNotifier.value != null ? DateFormat('yyyy-MM-dd').format(initialDateNotifier.value!) : null,
        finalDate: finalDateNotifier.value != null ? DateFormat('yyyy-MM-dd').format(finalDateNotifier.value!) : null);
    emit(AppState<List<ImageEntity>>.success(data));
  }

  void sendSearch() {
    add(const HomeRequestEvent());
  }
}
