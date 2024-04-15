import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_project/modules/image_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute(
        '/',
        module: ImageModule(),
      ),
    ];
  }
}
