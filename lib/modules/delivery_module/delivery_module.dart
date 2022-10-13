import 'package:edge_delivery/modules/delivery_module/delivery_home_page.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/request_delivery_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeliveryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DeliveryHomePage(), children: [
          ChildRoute('/request_home', child: (context, args) => RequestDeliveryPage(userEntity: args.data)),
          ChildRoute('/delivery_history', child: (context, args) => RequestDeliveryPage(userEntity: args.data)),
          ChildRoute('/payment', child: (context, args) => RequestDeliveryPage(userEntity: args.data)),
        ] ),
      ];
}
