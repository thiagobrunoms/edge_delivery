import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_controller.dart';
import 'package:flutter/material.dart';

class DeliveryHistoryPage extends StatefulWidget {
  const DeliveryHistoryPage({super.key});

  @override
  State<DeliveryHistoryPage> createState() => _DeliveryHistoryPageState();
}

class _DeliveryHistoryPageState extends State<DeliveryHistoryPage> {
  late FirebaseFirestore instance;
  DeliveryHistoryController controller = DeliveryHistoryController();
  int count = 0;

  @override
  void initState() {
    super.initState();

    instance = FirebaseFirestore.instance;

    instance.collection('deliveries').snapshots().listen((event) {
      for (var eachDoc in event.docs) {
        print(eachDoc.id);
        print(eachDoc.data());
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: controller.numberStream,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                int data = snapshot.data!;
                return Text('Numero puro: $data');
              }

              return const Text('Sem dados para mostrar!');
            }
          ),
          StreamBuilder<int>(
            stream: controller.numberTimes2Stream,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                int data = snapshot.data!;
                return Text('Numero * 2: $data');
              }

              return const Text('Sem dados para mostrar!');
            }
          ),
          StreamBuilder<int>(
            stream: controller.numberEven2Stream,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                int data = snapshot.data!;
                return Text('Even: $data');
              }

              return const Text('Sem dados para mostrar!');
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        count += 1;
        controller.addContent(count);
      }, child: const Icon(Icons.add),),
    );
  }
}