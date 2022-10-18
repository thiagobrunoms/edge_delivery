import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
part 'delivery_history_controller.g.dart';

class DeliveryHistoryController = _DeliveryHistoryControllerBase with _$DeliveryHistoryController;

abstract class _DeliveryHistoryControllerBase with Store {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  @observable
  DateTime currentDateTime = DateTime.now();

  void forwardDateTime() {
    currentDateTime = currentDateTime.add(const Duration(days: 31));
  }

  void backwardDateTime() {
    currentDateTime = currentDateTime.subtract(const Duration(days: 31));
  }

  Future<void> filter() async {
    print('->> ${Timestamp.fromDate(DateTime(2022, 10, 18))}');

    DateTime now = DateTime.now();
    QuerySnapshot qn = await instance.collection('deliveries')
      .where('date_str', isEqualTo: '18/10')
      .get();


    print('quantidade filtrada = ${qn.docs.length}');
  }
}