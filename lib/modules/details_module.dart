import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_project/domain/services/image_service.dart';
import 'package:nasa_project/domain/usecases/save_image_usecase.dart';
import 'package:nasa_project/infra/services/image_service.dart';

import 'package:nasa_project/presenter/pages/details/details_bloc.dart';
import 'package:nasa_project/presenter/pages/details/details_page.dart';

class DetailsModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.lazySingleton<IImageService>(
        (i) => ImageService(
          imageDriver: i.get(),
        ),
      ),
      Bind.lazySingleton<SaveImageUsecase>(
        (i) => SaveImageUsecase(
          imageService: i.get(),
        ),
      ),
      Bind.lazySingleton(
        (i) => DetailsBloc(
          saveImageUsecase: i.get(),
        ),
      ),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        '/',
        child: (context, args) => DetailPage(
          image: args.data['image'],
        ),
      ),
    ];
  }
}
