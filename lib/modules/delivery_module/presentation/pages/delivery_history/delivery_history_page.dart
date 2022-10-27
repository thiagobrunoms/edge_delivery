import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/domain/delivery.dart';
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
    return Observer(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildStatusContent(DeliveryStatus.Delivered, controller.statusMap[DeliveryStatus.Delivered]!),
            buildStatusContent(DeliveryStatus.InProgress, controller.statusMap[DeliveryStatus.InProgress]!),
            buildStatusContent(DeliveryStatus.Failed, controller.statusMap[DeliveryStatus.Failed]!),
          ],
        );
      }
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
    return Observer(
      builder: (context) {
        if (controller.deliveriesMapStream.isNotEmpty) {
          List<Widget> cards = controller.deliveriesMapStream.entries.map((entry) {
            
            DateTime date = entry.key;
            QuerySnapshot<Map<String, dynamic>>? querySnapshot = entry.value.data;
            if (querySnapshot != null) {
              List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;

              if (docs.isNotEmpty) {
                int quantity = docs.length;
                
                return _buildDeliveryCard(
                  date, 
                  docs.map((eachFirebasedDoc) =>  Delivery.fromMap(eachFirebasedDoc.id, eachFirebasedDoc.data())).toList());
              }
            }

            return Container();

          } ).toList();

          return Column(
            children: cards,
          );
        }

        return const Text('Sem dados para mostrar!');
      }
    );
  }

  Widget _buildDeliveryCard(DateTime date, List<Delivery> deliveryList) {
    DateFormat df = DateFormat('d MMM, y');

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: date.day == DateTime.now().day ? const Color.fromARGB(255, 225, 233, 241) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${df.format(date)}'),
                  Observer(
                    builder: (context) {
                      return Text("${deliveryList.length} deliveries");
                    }
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Modular.to.pushNamed('./delivery_details', arguments: deliveryList.first);
                },
                child: const Icon(Icons.arrow_forward_ios, size: 15,))
            ],
          ),
        ),
      ),
    );
  }
}