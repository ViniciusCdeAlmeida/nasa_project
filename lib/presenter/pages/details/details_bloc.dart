import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/usecases/save_image_usecase.dart';
import 'package:nasa_project/presenter/shared/app_state.dart';

part 'details_event.dart';

class DetailsBloc extends Bloc<DetailsEvent, AppState<ImageEntity>> {
  final SaveImageUsecase _saveImageUsecase;

  DetailsBloc({
    required SaveImageUsecase saveImageUsecase,
  })  : _saveImageUsecase = saveImageUsecase,
        super(AppState.init()) {
    on<SaveDetailsRequestEvent>((event, emit) async {
      await _saveData(event, emit);
    });
  }

  Future<void> _saveData(SaveDetailsRequestEvent event, Emitter<AppState<ImageEntity>> emit) async {
    emit(AppState<ImageEntity>.loading());
    await _saveImageUsecase(event.image);
    // final data = await _getImageUsecase(
    //     initialDate:
    //         initialDateNotifier.value != null ? DateFormat('yyyy-MM-dd').format(initialDateNotifier.value!) : null,
    //     finalDate: finalDateNotifier.value != null ? DateFormat('yyyy-MM-dd').format(finalDateNotifier.value!) : null);
    // emit(AppState<List<ImageEntity>>.success(data));
  }

  void saveData(ImageEntity image) {
    add(SaveDetailsRequestEvent(
      image: image,
    ));
  }
}
