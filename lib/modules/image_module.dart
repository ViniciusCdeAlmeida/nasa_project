import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_project/domain/repositories/image_repository.dart';
import 'package:nasa_project/domain/usecases/get_image_usecase.dart';
import 'package:nasa_project/external/datasources/image_external_datasource.dart';
import 'package:nasa_project/infra/datasources/image_external_datasource.dart';
import 'package:nasa_project/infra/repositories/home_repository.dart';
import 'package:nasa_project/presenter/pages/home/home_bloc.dart';
import 'package:nasa_project/presenter/pages/home/home_page.dart';

class ImageModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.lazySingleton<IImageExternalDatasource>(
        (i) => ImageExternalDatasource(
          apiProxy: i.get(),
        ),
      ),
      Bind.lazySingleton<IImageRepository>(
        (i) => ImageRepository(
          imageDatasource: i.get(),
        ),
      ),
      Bind.lazySingleton<GetImageUsecase>(
        (i) => GetImageUsecase(
          imageRepository: i.get(),
        ),
      ),
      Bind.lazySingleton(
        (i) => HomeBloc(
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
        child: (context, args) => const HomePage(),
      ),
    ];
  }
}
