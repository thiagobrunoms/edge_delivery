import 'package:edge_delivery/modules/delivery_module/domain/delivery.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_details/delivery_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        child: SingleChildScrollView(
          child: Observer(
            builder: ((context) {
              if (controller.listenToDelivery.data != null) {
                Delivery delivery = controller.listenToDelivery.data!;

                return Column(
                  children: [
                    _buildAppBar(delivery),
                    _buildDeliveryStatus(delivery),
                    _buildDeliveryDetails(delivery),
                  ],
                );
                
                
              }
              
              return Container();
            })),
        ),
      )
    );
  }

  Widget _buildAppBar(Delivery delivery) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {
          Modular.to.pop();
        }, 
        icon: const Icon(Icons.arrow_back_ios),),
        Text(delivery.user),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }

  Widget _buildDeliveryStatus(Delivery delivery) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Chip(label: Text(delivery.id), backgroundColor: Color.fromARGB(255, 239, 247, 255)),
        Text(delivery.status.name, style: const TextStyle(color: Color.fromARGB(255, 80, 148, 203)),)
      ],
    );
  }

  Widget _buildDeliveryDetails(Delivery delivery) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 239, 247, 255),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text('12 Jul 2021'),
                  Text('8:30'),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.check_circle, color: Colors.red,),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.red,
                  ), 
                ],
              )
            ],
          ),
        ],
      ),
    );
  } 
}