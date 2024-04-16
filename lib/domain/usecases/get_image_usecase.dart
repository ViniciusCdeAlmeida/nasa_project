import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/repositories/image_repository.dart';

class GetImageUsecase {
  final IImageRepository _imageRepository;

  GetImageUsecase({
    required IImageRepository imageRepository,
  }) : _imageRepository = imageRepository;

  Future<List<ImageEntity>> call({
    String? initialDate,
    String? finalDate,
  }) async {
    return await _imageRepository.getData(
      initialDate: initialDate,
      finalDate: finalDate,
    );
  }
}
