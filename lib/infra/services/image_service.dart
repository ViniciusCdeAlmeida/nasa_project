import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/services/image_service.dart';
import 'package:nasa_project/infra/drivers/image_driver.dart';

final class ImageService implements IImageService {
  final IImageDriver _imageDriver;

  ImageService({
    required IImageDriver imageDriver,
  }) : _imageDriver = imageDriver;
  @override
  Future<List<ImageEntity>> getAllImages() async {
    return _imageDriver.getData();
  }

  @override
  Future<void> removeImage({
    required ImageEntity image,
  }) async {
    return await _imageDriver.removeData(
      image: image,
    );
  }

  @override
  Future<void> saveImage({
    required ImageEntity image,
  }) async {
    await _imageDriver.addData(
      image: image,
    );
  }
}
