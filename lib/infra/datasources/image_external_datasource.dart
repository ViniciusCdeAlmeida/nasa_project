import 'package:nasa_project/domain/entities/image_entity.dart';

abstract interface class IImageExternalDatasource {
  Future<List<ImageEntity>> getData({
    String? date,
    String? startDate,
    String? endDate,
  });
}
