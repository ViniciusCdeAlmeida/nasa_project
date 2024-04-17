import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/external/mappers/image_mapper.dart';
import 'package:nasa_project/external/proxy/api_proxy.dart';
import 'package:nasa_project/infra/datasources/image_external_datasource.dart';

final class ImageExternalDatasource implements IImageExternalDatasource {
  final ApiProxy _apiProxy;

  ImageExternalDatasource({
    required ApiProxy apiProxy,
  }) : _apiProxy = apiProxy;

  @override
  Future<List<ImageEntity>> getData({
    String? startDate,
    String? endDate,
  }) async {
    final Map<String, dynamic> queryParams = {
      'start_date': startDate,
      'end_date': endDate,
    };
    final response = await _apiProxy.get(
      '',
      queryParameters: queryParams,
    );
    return (response.data as Iterable).map((e) => ImageMapper.fromMap(e)).toList();
  }
}
