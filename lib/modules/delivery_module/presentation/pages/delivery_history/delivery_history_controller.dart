import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_page.dart';
import 'package:mobx/mobx.dart';
part 'delivery_history_controller.g.dart';

class DeliveryHistoryController = _DeliveryHistoryControllerBase with _$DeliveryHistoryController;

abstract class _DeliveryHistoryControllerBase with Store {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  Map<DeliveryStatus, int> deliveryStatusMap = {DeliveryStatus.Delivered: 0, DeliveryStatus.Failed: 0, DeliveryStatus.InProgress: 0};

  _DeliveryHistoryControllerBase() {
    filterDeliveryByDate();
  }  

  @observable
  DateTime currentDateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @observable
  ObservableMap<DateTime, ObservableStream<QuerySnapshot<Map<String, dynamic>>>> deliveriesMapStream = ObservableMap();

  @observable
  ObservableMap<DeliveryStatus, int> statusMap = ObservableMap.of({DeliveryStatus.Delivered: 0, DeliveryStatus.Failed: 0, DeliveryStatus.InProgress: 0});

  void fowardDate() {
    currentDateTime = currentDateTime.add(const Duration(days: 31));
    filterDeliveryByDate();
  }

  void backwardDate() {
    currentDateTime = currentDateTime.subtract(const Duration(days: 31));
    filterDeliveryByDate();
  }

  Future<void> filterDeliveryByDate() async {
    print('Filtering by ${currentDateTime}');

    deliveriesMapStream.clear();
    statusMap = ObservableMap.of(deliveryStatusMap);
    
    // Stream<QuerySnapshot<Map<String, dynamic>>> result =  
    //   instance.collection('deliveries')
    //   .where('date', isGreaterThanOrEqualTo: DateTime(currentDateTime.year, currentDateTime.month, 1), isLessThan: DateTime(currentDateTime.year, currentDateTime.month, 31))
    //   .snapshots();

    for (int i = 1; i < 31; i++) {
      DateTime dateToLoad = DateTime(currentDateTime.year, currentDateTime.month, i);

      Stream<QuerySnapshot<Map<String, dynamic>>> deliveryStreamByDate =  
        instance.collection('deliveries')
          .where('date', isGreaterThanOrEqualTo: dateToLoad, isLessThan: dateToLoad.add(const Duration(days: 1)))
          .snapshots();

      deliveriesMapStream[dateToLoad] = ObservableStream(deliveryStreamByDate);

      deliveriesMapStream[dateToLoad]!.listen((value) {
        if (value.docs.isNotEmpty) {
          print('date ${dateToLoad} -> delivery ${value.docs.length}');
          
          value.docs.forEach((eachDoc) {
            String statusStr = eachDoc.data()['status'];
            DeliveryStatus status = DeliveryStatus.values.firstWhere((statusOb) => statusOb.name == statusStr);

            print('quantidade atual para ${status.name} = ${statusMap[status]}');
            statusMap[status] = statusMap[status]! + 1; 
          });
        }
      });
    }
  }
}