import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/external/mappers/image_mapper.dart';

import '../../mocks/infra/image_driver_mock.mocks.dart';

void main() {
  final MockIImageDriver imageDriver = MockIImageDriver();
  final fakeEntity = ImageMapper.fake();
  final fakeEntityList = ImageMapper.fakeList(4);

  group('#getImages', () {
    test('should return saved list images', () async {
      when(imageDriver.getData()).thenAnswer(
        (realInvocation) => fakeEntityList,
      );
      final result = imageDriver.getData();
      expect(result.fold(fakeEntity, (previousValue, element) => previousValue), isA<List<ImageEntity>>());
    });
  });
}
