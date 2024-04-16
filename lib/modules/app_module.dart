import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_project/external/drivers/image_driver.dart';
import 'package:nasa_project/external/proxy/api_proxy.dart';
import 'package:nasa_project/infra/drivers/image_driver.dart';
import 'package:nasa_project/modules/details_module.dart';
import 'package:nasa_project/modules/image_module.dart';
import 'package:nasa_project/modules/saved_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton<IImageDriver>(
        (i) => ImageDriver(),
      ),
      Bind.lazySingleton<ApiProxy>(
        (i) => ApiProxy(
          apiUrl: dotenv.env['API_URL']!,
          apikey: dotenv.env['API_KEY']!,
        ),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute(
        '/',
        module: ImageModule(),
      ),
      ModuleRoute(
        '/details',
        module: DetailsModule(),
      ),
      ModuleRoute(
        '/saved',
        module: SavedModule(),
      ),
    ];
  }
}
