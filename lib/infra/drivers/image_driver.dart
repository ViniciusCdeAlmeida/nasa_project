import 'package:nasa_project/domain/entities/image_entity.dart';

abstract interface class IImageDriver {
  Future<void> addData({
    required ImageEntity image,
  });
  Future<void> removeData({
    required ImageEntity image,
  });

  List<ImageEntity> getData();
}
