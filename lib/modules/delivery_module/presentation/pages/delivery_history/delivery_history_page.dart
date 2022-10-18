import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_controller.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

enum DeliveryStatus {
  Delivered('Delivered'),
  InProgress('In Progress'),
  Failed('Failed');

  final String name;
  const DeliveryStatus(this.name);

}

class DeliveryHistoryPage extends StatefulWidget {
  const DeliveryHistoryPage({super.key});

  @override
  State<DeliveryHistoryPage> createState() => _DeliveryHistoryPageState();
}

class _DeliveryHistoryPageState extends State<DeliveryHistoryPage> {
  late FirebaseFirestore instance;
  late DeliveryHistoryController controller;
  int count = 0;

  @override
  void initState() {
    super.initState();

    instance = FirebaseFirestore.instance;
    controller = Modular.get<DeliveryHistoryController>();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DefaultAppBar(),
              _buildDateFilter(),
              _buildDeliveryStatus(),
              _buildDeliveries(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateFilter() {
    DateFormat df = DateFormat('MMM, y');

    double arrowSize = 15;
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey, width: 0.3)
      ),
      child: Observer(
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              InkWell(
                onTap: () {
                  controller.backwardDate();
                },
                child: Icon(Icons.arrow_back_ios, size: arrowSize,)),
              Text(df.format(controller.currentDateTime)),
              InkWell(
                onTap: () {
                  controller.fowardDate();
                },
                child: Icon(Icons.arrow_forward_ios, size: arrowSize)),
            ],
          );
        }
      ),
    );
  }

  Widget _buildDeliveryStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildStatusContent(DeliveryStatus.Delivered, 50),
        buildStatusContent(DeliveryStatus.InProgress, 50),
        buildStatusContent(DeliveryStatus.Failed, 50),
      ],
    );
  }

  Widget buildStatusContent(DeliveryStatus status, int quantity) {
    return Column(
      children: [
        Text(quantity.toString()),
        const SizedBox(height: 5,),
        Text(status.name),
      ],
    );
  }

  Widget _buildDeliveries() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: instance.collection('deliveries').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot<Map<String, dynamic>> data = snapshot.data!;
          
          List<Widget> deliveryWidgetsList = data.docs.map((eachQuerySnapshot) => _buildDeliveryCard(eachQuerySnapshot) ).toList();

          return Column(
            children: deliveryWidgetsList,
          );
        }

        return const Text('Sem dados para mostrar!');
      }
    );
  }

  Widget _buildDeliveryCard(QueryDocumentSnapshot<Map<String, dynamic>> querySnapshot) {
    DateFormat df = DateFormat('MMM, y');
    Map<String, dynamic> deliveryMap = querySnapshot.data();

    Timestamp timestamp = deliveryMap['date'];
    DateTime deliveryDateTime = timestamp.toDate();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: deliveryDateTime.day == DateTime.now().day ? const Color.fromARGB(255, 225, 233, 241) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${df.format(deliveryDateTime)}'),
                  Observer(
                    builder: (context) {
                      return Text("${controller.deliveryQuantity} deliveries");
                    }
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios, size: 15,)
            ],
          ),
        ),
      ),
    );
  }
}