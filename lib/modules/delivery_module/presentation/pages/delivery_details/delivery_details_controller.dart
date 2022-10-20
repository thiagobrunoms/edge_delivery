import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/domain/delivery.dart';
import 'package:mobx/mobx.dart';
part 'delivery_details_controller.g.dart';

class DeliveryDetailsController = _DeliveryDetailsControllerBase with _$DeliveryDetailsController;

abstract class _DeliveryDetailsControllerBase with Store {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  String deliveryId = "";
  void setDeliveryid (String deliveryId) {
    this.deliveryId = deliveryId;
  }

  ObservableStream<DocumentSnapshot<Map<String, dynamic>>> get listenToDelivery => ObservableStream(instance.collection('deliveries').doc(deliveryId).snapshots() );
}