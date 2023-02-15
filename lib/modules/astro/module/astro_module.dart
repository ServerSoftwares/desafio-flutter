import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants/astro_constant_routes.dart';
import '../data/remote/data_source/astro_remote_data_source.dart';
import '../data/repository/astro_repository_impl.dart';
import '../data/repository/geolocator_repository_impl.dart';
import '../domain/repository/astro_repository.dart';
import '../domain/repository/geolocator_repository.dart';
import '../domain/use_case/get_body_list_details_model_use_case.dart';
import '../domain/use_case/get_body_list_use_case.dart';
import '../domain/use_case/get_moon_phase_image_use_case.dart';
import '../domain/use_case/get_position_use_case.dart';
import '../domain/use_case/get_star_chart_image_use_case.dart';
import '../domain/use_case/verify_if_location_permission_is_enabled_use_case.dart';
import '../external/remote_data_source/astro_remote_data_source_impl.dart';
import '../presentation/controller/celestial_body_page_controller.dart';
import '../presentation/controller/moon_phase_page_controller.dart';
import '../presentation/controller/star_chart_page_controller.dart';
import '../presentation/page/celestial_body_page.dart';
import '../presentation/page/moon_phase_page.dart';
import '../presentation/page/star_chart_page.dart';

class AstroModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton<AstroRemoteDataSource>(
          (i) => AstroRemoteDataSourceImpl(dio: i()),
        ),
        Bind.lazySingleton<AstroRepository>(
          (i) => AstroRepositoryImpl(astroRemoteDataSource: i()),
        ),
        Bind.lazySingleton<GeolocatorRepository>(
            (i) => GeolocatorRepositoryImpl()),
        Bind.lazySingleton<GetMoonPhaseImageUseCase>(
          (i) => GetMoonPhaseImageUseCaseImpl(astroRepository: i()),
        ),
        Bind.lazySingleton<GetBodyListUseCase>(
          (i) => GetBodyListUseCaseImpl(astroRepository: i()),
        ),
        Bind.lazySingleton<GetBodyDetailsModelUseCase>(
          (i) => GetBodyDetailsModelUseCaseImpl(astroRepository: i()),
        ),
        Bind.lazySingleton<GetPositionUseCase>(
            (i) => GetPositionUseCaseImpl(geolocatorRepository: i())),
        Bind.lazySingleton<GetStarChartImageUseCase>(
            (i) => GetStarChartImageUseCaseImpl(astroRepository: i())),
        Bind.lazySingleton<VerifyIfLocationPermissionIsEnabledUseCase>(
            (i) => VerifyIfLocationPermissionIsEnabledUseCaseImpl()),
        Bind.factory<MoonPhasePageController>(
          (i) => MoonPhasePageController(
            getMoonPhaseImageUseCase: i(),
            getPositionUseCase: i(),
            verifyIfLocationPermissionIsEnabledUseCase: i(),
          ),
        ),
        Bind.factory<CelestialBodyPageController>(
          (i) => CelestialBodyPageController(
            getBodyListUseCase: i(),
            getBodyDetailsModelUseCase: i(),
          ),
        ),
        Bind.factory<StarChartPageController>(
          (i) => StarChartPageController(getStarChartImageUseCase: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AstroConstantRoutes.moonPhasePage,
          child: (context, args) => const MoonPhasePage(),
        ),
        ChildRoute(
          AstroConstantRoutes.celestialBodiesPage,
          child: (context, args) => CelestialBodyPage(
            latitude: args.data[0],
            longitude: args.data[1],
          ),
        ),
        ChildRoute(
          AstroConstantRoutes.starChartPage,
          child: (context, args) => StarChartPage(
            latitude: args.data[0],
            longitude: args.data[1],
          ),
        ),
      ];
}
