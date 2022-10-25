import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_page.dart';
import 'package:mobx/mobx.dart';
part 'delivery_history_controller.g.dart';

class DeliveryHistoryController = _DeliveryHistoryControllerBase with _$DeliveryHistoryController;

abstract class _DeliveryHistoryControllerBase with Store {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  _DeliveryHistoryControllerBase() {
    filterDeliveryByDate();
  }  

  @observable
  DateTime currentDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @observable
  ObservableMap<DateTime, ObservableStream<QuerySnapshot<Map<String, dynamic>>>> deliveriesMapStream = ObservableMap();

  @observable
  ObservableMap<DeliveryStatus, int> statusMap = ObservableMap.of({DeliveryStatus.Delivered : 0, DeliveryStatus.Failed : 0, DeliveryStatus.InProgress : 0});

  void fowardDate() {
    currentDateTime = currentDateTime.add(const Duration(days: 31));
    filterDeliveryByDate();
  }

  void backwardDate() {
    currentDateTime = currentDateTime.subtract(const Duration(days: 31));
    filterDeliveryByDate();
  }

  Future<void> filterDeliveryByDate() async {
    statusMap.clear();
    statusMap.addEntries([MapEntry(DeliveryStatus.Delivered, 0), MapEntry(DeliveryStatus.Failed, 0), MapEntry(DeliveryStatus.InProgress, 0)]);
    deliveriesMapStream.clear();

    DateTime startDateTime = DateTime(currentDateTime.year, currentDateTime.month, 1);
    for (int i = 0; i < 31; i++) {
      DateTime dateToLoad = startDateTime.add(Duration(days: i));
      Stream<QuerySnapshot<Map<String, dynamic>>> stream = 
        instance.collection('deliveries').where('date', isGreaterThanOrEqualTo: dateToLoad, isLessThan: dateToLoad.add(const Duration(days: 1))).snapshots();

      deliveriesMapStream[dateToLoad] = ObservableStream(stream);

      deliveriesMapStream[dateToLoad]!.listen((event) {
        if (event.docs.isNotEmpty) {
            event.docs.forEach((eachDoc) {
            String statusStr = eachDoc.data()['status'];
            print('status = ${statusStr}');
            DeliveryStatus status = DeliveryStatus.values.firstWhere((e) => e.name == statusStr);
            statusMap[status] = statusMap[status]! + 1;
          });
        }
      });

      // observableFuture = ObservableFuture(_loadData(dateToLoad));
      // print(observableFuture!.status);
      // List<QueryDocumentSnapshot<Map<String, dynamic>>> deliveryList = await observableFuture!;

      // print('Found for $dateToLoad = ${deliveryList.length}');
      // if (deliveryList.isNotEmpty) {
      //   List<Delivery> deliveries = deliveryList.map((eachQD) => Delivery.fromMap(eachQD.data()) ).toList();
      //   deliveriesMap[dateToLoad] = deliveries;
      // }
    }
  }


  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> _loadData(DateTime searchDateTime) async {
  //   QuerySnapshot<Map<String, dynamic>> result = await 
  //     instance.collection('deliveries')
  //     .where('date', isGreaterThanOrEqualTo: searchDateTime, isLessThan: searchDateTime.add(const Duration(days: 1)))
  //     .get();

  //   return result.docs;
  // }
}