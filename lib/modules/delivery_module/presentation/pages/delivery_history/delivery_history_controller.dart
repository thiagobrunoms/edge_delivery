import 'package:cloud_firestore/cloud_firestore.dart';
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
  int deliveryQuantity = 0;

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
    
    QuerySnapshot<Map<String, dynamic>> result = await 
      instance.collection('deliveries')
      .where('date', isGreaterThanOrEqualTo: DateTime(2022, 10, 18), isLessThan: DateTime(2022, 10, 19))
      .get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = result.docs;
    deliveryQuantity = docs.length;
    print('Quantity = ${deliveryQuantity}');
    print('Object ${docs.first.data()}');
  }
}