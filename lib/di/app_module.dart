import 'package:flutter_modular/flutter_modular.dart';

import '../modules/astro/module/astro_module.dart';
import '../modules/common/app_constant_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppConstantsRoutes.astroModule, module: AstroModule()),
      ];
}
