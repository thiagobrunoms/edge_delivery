import 'dart:async';

class FormController {
  StreamController<int> numberController = StreamController.broadcast();

  Stream<int> get numberStream => numberController.stream;

  Stream<int> get numberOddStream => numberController.stream.where((number) => number % 2 == 0);

  Stream<int> get numberDoubleStream => numberController.stream.map((number) => number * 2);

}