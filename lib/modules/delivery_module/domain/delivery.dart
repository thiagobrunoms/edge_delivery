import 'package:edge_delivery/modules/delivery_module/domain/delivery_step.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/pages/delivery_history/delivery_history_page.dart';

class Delivery {
  final String id;
  final DateTime date;
  final String address;
  final String user;
  final DeliveryStatus status;
  final List<DeliveryStep> steps;

  Delivery({required this.id, required this.date, required this.address, required this.user, required this.status, required this.steps});

  factory Delivery.fromMap(String id, Map<String, dynamic> data) {
    DeliveryStatus status = DeliveryStatus.values.where((each) => data['status'] == each.name).first;

    List<DeliveryStep> steps = [];
    if (data['steps'] != null) {
      steps = (data['steps'] as List).map((eachMap) => DeliveryStep.fromMap(eachMap) ).toList();
    }

    return Delivery(id: id, date: data['date'].toDate(), address: data['address'], user: data['user'], status: status, steps: steps);
  }

}