import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/domain/delivery.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_controller.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

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
              controller.observableFuture != null && 
                controller.observableFuture!.status == FutureStatus.pending &&
                controller.observableFuture!.status != FutureStatus.fulfilled ?
                  const CircularProgressIndicator() : Container()
            ],
          ),
        )
      ),
    );
  }

  Widget _buildDateFilter() {
    DateFormat df = DateFormat('MMM, y');

    double arrowSize = 15;
    return Observer(
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 0.3)
          ),
          child: Row(
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
          )
        );
      }
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
        int quantity = 0;

        if (controller.deliveriesMapStream.isNotEmpty) {
          List<Widget> deliveryWidgetsList = controller.deliveriesMapStream.entries.map((entry) {
            QuerySnapshot<Map<String, dynamic>>? querySnapshot = entry.value.data;
            if (querySnapshot != null) {
              List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;

              print('docs de ${controller.currentDateTime} = length ${docs.length}');
              if (docs.isNotEmpty) {
                docs.removeWhere(((element) => element.data()['status'] == null ));
                if (docs.isNotEmpty) {
                  print('Size after removing: ${docs.length}');
                  quantity += 1;
                  return _buildDeliveryCard(entry.key, docs.map((qs) => Delivery.fromMap( qs.id, qs.data() ) ).toList() );
                }
              }
            }

            return Container();
          }).toList();

          print('Quantidade de DIAS entregas: ${deliveryWidgetsList}');
          if (quantity > 0) {
            return Column(
              children: deliveryWidgetsList,
            );
          }

          return const Center(child: Text('Não há entregas para hoje!'));

        }

        return const CircularProgressIndicator();
      }
    );
  }

  Widget _buildDeliveryCard(DateTime dateTime, List<Delivery> deliveries) {
    DateFormat df = DateFormat('d MMM, y');

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: dateTime.day == DateTime.now().day ? const Color.fromARGB(255, 225, 233, 241) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${df.format(dateTime)}'),
                  Observer(
                    builder: (context) {
                      return Text("${deliveries.length} deliveries");
                    }
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Modular.to.navigate('./delivery_details', arguments: deliveries.first);
                },
                child: const Icon(Icons.arrow_forward_ios, size: 15,))
            ],
          ),
        ),
      ),
    );
  }
}