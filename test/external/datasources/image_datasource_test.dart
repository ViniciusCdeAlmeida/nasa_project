import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/external/datasources/image_external_datasource.dart';
import 'package:nasa_project/external/mappers/image_mapper.dart';
import '../../mocks/external/api_proxy_mock.mocks.dart';

void main() {
  final MockApiProxy apiProxy = MockApiProxy();
  final ImageExternalDatasource datasource = ImageExternalDatasource(apiProxy: apiProxy);
  final fakeEntity = ImageMapper.fake();
  final fakeEntityList = ImageMapper.fakeList(4);

  group('#getImages', () {
    test('should  return List the Product', () async {
      final response = Response<dynamic>(
        data: fakeEntityList,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );
      when(apiProxy.get(any)).thenAnswer((_) async => response);
      final result = await datasource.getData();
      expect(result.fold(fakeEntity, (previousValue, element) => previousValue), isA<List<ImageEntity>>());
    });
  });
}
