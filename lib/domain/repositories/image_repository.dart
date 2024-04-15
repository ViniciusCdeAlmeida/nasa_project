import 'package:nasa_project/domain/entities/image_entity.dart';

abstract interface class IImageRepository {
  Future<List<ImageEntity>> getData();
}
