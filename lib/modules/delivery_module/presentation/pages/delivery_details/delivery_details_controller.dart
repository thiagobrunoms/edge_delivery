import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edge_delivery/modules/delivery_module/domain/delivery.dart';
import 'package:mobx/mobx.dart';
part 'delivery_details_controller.g.dart';

class DeliveryDetailsPageController = _DeliveryDetailsPageControllerBase with _$DeliveryDetailsPageController;

abstract class _DeliveryDetailsPageControllerBase with Store {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  @observable
  String deliveryId = "";

  @action
  void setDeliveryId(String deliveryId) {
    this.deliveryId = deliveryId;
  }

  @computed
  ObservableStream<Delivery> get listenToDelivery => ObservableStream(
    instance.collection('deliveries').doc(deliveryId).snapshots()
      .map<Delivery>((event) => Delivery.fromMap(event.id, event.data()!) )
  );


}