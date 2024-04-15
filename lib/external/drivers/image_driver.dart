import 'package:hive/hive.dart';
import 'package:nasa_project/infra/drivers/image_driver.dart';

class ImageDriver implements IImageDriver {
  ImageDriver() {
    _initHiveBox();
  }

  late Box boxAlarm;
  late String alarmKey;

  void _initHiveBox() async {
    await Hive.openBox('images');
    boxAlarm = Hive.box('images');
  }
}
