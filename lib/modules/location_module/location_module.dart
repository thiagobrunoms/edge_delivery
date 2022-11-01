import 'package:edge_delivery/modules/location_module/location_page.dart';
import 'package:edge_delivery/modules/location_module/maps/maps_view_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LocationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const LocationPage()),
        ChildRoute('/', child: (context, args) => const MapsViewPage()),
      ];
}
