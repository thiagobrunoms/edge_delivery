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
  DeliveryDetailsController controller = DeliveryDetailsController();

  @override
  void initState() {
    super.initState();

    controller.setDeliveryid(widget.delivery.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: controller.listenToDelivery,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                Map<String, dynamic>? data = snapshot.data!.data();
                if (data != null) {
                  return Text(data['address']);
                }
              }
            }
      
            return Container();
          })),
      )
    );
  }
}