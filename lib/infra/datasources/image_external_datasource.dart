import 'package:nasa_project/domain/entities/image_entity.dart';

abstract class IImageExternalDatasource {
  Future<List<ImageEntity>> getData({
    String? date,
    String? startDate,
    String? endDate,
  });
}
