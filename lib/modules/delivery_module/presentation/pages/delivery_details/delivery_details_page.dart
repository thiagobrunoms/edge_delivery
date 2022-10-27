import 'package:edge_delivery/modules/delivery_module/domain/delivery.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_details/delivery_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DeliveryDetailsPage extends StatefulWidget {
  final Delivery delivery;
  const DeliveryDetailsPage({super.key, required this.delivery});

  @override
  State<DeliveryDetailsPage> createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  DeliveryDetailsPageController controller = DeliveryDetailsPageController();

  @override
  void initState() {
    super.initState();

    controller.setDeliveryId(widget.delivery.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (context) {
            if (controller.listenToDelivery.data != null) {
              Delivery delivery = controller.listenToDelivery.data;

              return Text('Id: ${delivery.id} - Address: ${delivery.address}');
            }

            return const CircularProgressIndicator();
          }
        )
      )
    );
  }
}