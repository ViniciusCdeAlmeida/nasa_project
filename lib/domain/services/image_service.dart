import 'package:nasa_project/domain/entities/image_entity.dart';

abstract interface class IImageService {
  Future<void> saveImage();

  Future<List<ImageEntity>> getAllImages();

  Future<void> removeImage();
}
