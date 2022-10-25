class DeliveryStep {
  final DateTime dateTime;
  final String description;

  DeliveryStep({required this.dateTime, required this.description});

  factory DeliveryStep.fromMap(Map<String, dynamic> data) {
    return DeliveryStep(dateTime: data['date'].toDate(), description: data['description'] );
  }
}