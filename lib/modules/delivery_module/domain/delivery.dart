import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_page.dart';

class Delivery {
  final String id;
  final DateTime date;
  final String address;
  final String user;
  final DeliveryStatus status;


  const Delivery({required this.id, required this.date, required this.address, required this.user, required this.status});

  factory Delivery.fromMap(String id, Map<String, dynamic> data) {

    DeliveryStatus status = DeliveryStatus.values.firstWhere((statusObj) => statusObj.name == data['status'] );

    return Delivery(id: id, date: data['date'].toDate(), address: data['address'], user: data['user'],  status: status );
  }
}