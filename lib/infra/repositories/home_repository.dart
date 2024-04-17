import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/repositories/image_repository.dart';
import 'package:nasa_project/infra/datasources/image_external_datasource.dart';

final class ImageRepository implements IImageRepository {
  final IImageExternalDatasource _imageDatasource;

  ImageRepository({
    required IImageExternalDatasource imageDatasource,
  }) : _imageDatasource = imageDatasource;
  @override
  Future<List<ImageEntity>> getData({
    String? initialDate,
    String? finalDate,
  }) async {
    return await _imageDatasource.getData(
      startDate: initialDate,
      endDate: finalDate,
    );
  }
}
