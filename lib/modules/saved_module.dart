import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_project/domain/services/image_service.dart';
import 'package:nasa_project/domain/usecases/get_saved_image_usecase.dart';
import 'package:nasa_project/infra/services/image_service.dart';
import 'package:nasa_project/presenter/pages/saved/saved_bloc.dart';
import 'package:nasa_project/presenter/pages/saved/saved_page.dart';

class SavedModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.lazySingleton<IImageService>(
        (i) => ImageService(
          imageDriver: i.get(),
        ),
      ),
      Bind.lazySingleton<GetSavedImageUsecase>(
        (i) => GetSavedImageUsecase(
          imageservice: i.get(),
        ),
      ),
      Bind.lazySingleton(
        (i) => SavedBloc(
          getImageUsecase: i.get(),
        ),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => const SavedPage(),
      ),
    ];
  }
}
