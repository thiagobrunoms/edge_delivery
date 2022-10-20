class Delivery {
  final String id;
  final DateTime date;
  final String address;
  final String user;

  Delivery({required this.id, required this.date, required this.address, required this.user});

  factory Delivery.fromMap(String id, Map<String, dynamic> data) {
    print(id);
    print(data);
    return Delivery(id: id, date: data['date'].toDate(), address: data['address'], user: data['user']);
  }

}