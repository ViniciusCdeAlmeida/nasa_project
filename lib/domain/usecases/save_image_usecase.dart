import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/services/image_service.dart';

class SaveImageUsecase {
  final IImageService _imageService;

  SaveImageUsecase({
    required IImageService imageService,
  }) : _imageService = imageService;

  Future<void> call(
    ImageEntity image,
  ) {
    return _imageService.saveImage(image: image);
  }
}
