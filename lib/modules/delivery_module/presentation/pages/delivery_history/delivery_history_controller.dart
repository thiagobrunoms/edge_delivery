import 'dart:async';

class DeliveryHistoryController {
  StreamController<int> numberController = StreamController.broadcast();

  Stream<int> get numberStream => numberController.stream;

  Stream<int> get numberTimes2Stream => numberController.stream.map((number) => number * 2);

  Stream<int> get numberEven2Stream => numberController.stream.where((number) => number % 2 == 0);

  void addContent(int number) {
    numberController.sink.add(number);
  }
}