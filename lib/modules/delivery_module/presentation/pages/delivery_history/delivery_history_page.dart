import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_controller.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

enum DeliveryStatus {
  DELIVERED('Delivered'),
  IN_PROGRESS('In Progress'),
  FAILED('Failed');

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
    controller.filter();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Builder(builder: (context) {
            return Column(
              children: [
                const DefaultAppBar(),
                _buildDateSelection(),
                _buildDeliveryStatus(),
                const Divider(),
                _buildDeliveryHistory()
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    double arrowSize = 15;
    DateFormat df = DateFormat('MMM, y');

    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey, width: 0.2)
      ),
      child: Observer(
        builder: (snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Icon(Icons.arrow_back_ios, size: arrowSize),
                onTap: () {
                  controller.backwardDateTime();
                },
              ),
              Text(df.format(controller.currentDateTime)),
              InkWell(
                child: Icon(Icons.arrow_forward_ios, size: arrowSize),
                onTap: () {
                  controller.forwardDateTime();
                },
              ),
            ],
          );
        }
      ),

    );
  }

  Widget _buildDeliveryStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatus(DeliveryStatus.DELIVERED, 50),
          _buildStatus(DeliveryStatus.IN_PROGRESS, 3),
          _buildStatus(DeliveryStatus.FAILED, 50),
        ],
      ),
    );
  }

  Widget _buildStatus(DeliveryStatus status, int quantity) {
    return Column(
      children: [
        Text(status.name),
        const SizedBox(height: 10,),
        Text(quantity.toString())
      ],
    );
  }

  Widget _buildDeliveryHistory() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: instance.collection('deliveries').snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>> qs = snapshot.data!;
            
            List<Widget> deliveriesWidget = qs.docs.map((eachMap) => _buildDelivery(eachMap.data())).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: deliveriesWidget,
            );
          }

          return const Text('Sem dados para mostrar!');
        }
      );
  }

  Widget _buildDelivery(Map<String, dynamic> data) {
    DateFormat df = DateFormat('d MMM, y');

    Timestamp t = data['date'];
    DateTime dateTime = t.toDate();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        color: dateTime.day == DateTime.now().day ? const Color.fromARGB(255, 224, 236, 246) : Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(df.format(dateTime)),
                  const SizedBox(height: 5,),
                  const Text('4 deliveries')
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