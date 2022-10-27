import 'package:dio/dio.dart';
import 'package:edge_delivery/modules/delivery_module/delivery_module.dart';
import 'package:edge_delivery/modules/location_module/location_module.dart';
import 'package:edge_delivery/modules/session_controller.dart';
import 'package:edge_delivery/modules/sign_up_module/signup_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => SessionController())
      ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: LocationModule()),
        // ModuleRoute('/', module: SignUpModule()),
        // ModuleRoute('/delivery/', module: DeliveryModule()),
      ];
}
