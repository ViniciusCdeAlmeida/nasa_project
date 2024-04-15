import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/repositories/image_repository.dart';

class HomeRepository implements IImageRepository {
  @override
  Future<List<ImageEntity>> getData() {
    throw UnimplementedError();
  }
}
