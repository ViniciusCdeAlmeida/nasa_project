import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/external/proxy/api_proxy.dart';
import 'package:nasa_project/infra/datasources/image_external_datasource.dart';

class ImageExternalDatasource implements IImageExternalDatasource {
  final ApiProxy _apiProxy;

  ImageExternalDatasource({
    required ApiProxy apiProxy,
  }) : _apiProxy = apiProxy;

  @override
  Future<List<ImageEntity>> getData({
    String? date,
    String? startDate,
    String? endDate,
  }) async {
    final Map<String, dynamic> queryParams = {
      'date': date,
      'start_date': startDate,
      'end_date': endDate,
    };
    final response = await _apiProxy.get(
      'api.nasa.gov/planetary/apod',
      queryParameters: queryParams,
    );
    return [];
    // return HomeSalesMapper.fromMap(response.data);
  }
}
