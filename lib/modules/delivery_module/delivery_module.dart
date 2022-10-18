import 'package:edge_delivery/modules/delivery_module/delivery_home_page.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_controller.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_page.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/payment_page.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/request_delivery_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeliveryModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => DeliveryHistoryController())
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DeliveryHomePage(), children: [
          ChildRoute('/request_home', child: (context, args) => const RequestDeliveryPage()),
          ChildRoute('/delivery_history', child: (context, args) => const DeliveryHistoryPage()),
          ChildRoute('/payment', child: (context, args) => const PaymentPage()),
        ] ),
      ];
}
