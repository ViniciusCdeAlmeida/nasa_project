import 'package:nasa_project/domain/entities/image_entity.dart';

abstract interface class IImageService {
  Future<void> saveImage({
    required ImageEntity image,
  });

  Future<List<ImageEntity>> getAllImages();

  Future<void> removeImage({
    required ImageEntity image,
  });
}
