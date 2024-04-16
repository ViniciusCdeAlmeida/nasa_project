import 'package:hive/hive.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/external/mappers/image_mapper.dart';
import 'package:nasa_project/infra/drivers/image_driver.dart';

final class ImageDriver implements IImageDriver {
  ImageDriver() {
    _initHiveBox();
  }

  late Box boxImage;
  late String alarmKey;

  Future<void> _initHiveBox() async {
    await Hive.openBox('images');
    boxImage = Hive.box('images');
  }

  @override
  List<ImageEntity> getData() {
    final data = <ImageEntity>[];
    var box = boxImage.toMap();

    box.forEach((key, value) {
      data.add(ImageMapper.fromMap(value));
    });
    return data;
  }

  @override
  Future<void> addData({required ImageEntity image}) async {
    await boxImage.put(image.title, ImageMapper.toMap(image));
  }

  @override
  Future<void> removeData({required ImageEntity image}) async {
    var box = boxImage.toMap();

    box.remove(image.title);
  }
}
