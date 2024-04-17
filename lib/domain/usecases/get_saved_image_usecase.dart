import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/services/image_service.dart';

class GetSavedImageUsecase {
  final IImageService _imageservice;

  GetSavedImageUsecase({
    required IImageService imageservice,
  }) : _imageservice = imageservice;

  Future<List<ImageEntity>> call() async {
    return await _imageservice.getAllImages();
  }
}
