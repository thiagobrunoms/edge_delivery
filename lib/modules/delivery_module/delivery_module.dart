import 'package:edge_delivery/modules/delivery_module/presentation/delivery_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeliveryModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => DeliveryPage(
                  userEntity: args.data,
                )),
      ];
}
