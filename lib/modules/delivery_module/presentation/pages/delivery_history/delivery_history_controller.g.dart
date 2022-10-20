// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeliveryHistoryController on _DeliveryHistoryControllerBase, Store {
  late final _$currentDateTimeAtom = Atom(
      name: '_DeliveryHistoryControllerBase.currentDateTime', context: context);

  @override
  DateTime get currentDateTime {
    _$currentDateTimeAtom.reportRead();
    return super.currentDateTime;
  }

  @override
  set currentDateTime(DateTime value) {
    _$currentDateTimeAtom.reportWrite(value, super.currentDateTime, () {
      super.currentDateTime = value;
    });
  }

  late final _$deliveriesMapAtom = Atom(
      name: '_DeliveryHistoryControllerBase.deliveriesMap', context: context);

  @override
  ObservableMap<DateTime, List<Delivery>> get deliveriesMap {
    _$deliveriesMapAtom.reportRead();
    return super.deliveriesMap;
  }

  @override
  set deliveriesMap(ObservableMap<DateTime, List<Delivery>> value) {
    _$deliveriesMapAtom.reportWrite(value, super.deliveriesMap, () {
      super.deliveriesMap = value;
    });
  }

  late final _$observableFutureAtom = Atom(
      name: '_DeliveryHistoryControllerBase.observableFuture',
      context: context);

  @override
  ObservableFuture<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      get observableFuture {
    _$observableFutureAtom.reportRead();
    return super.observableFuture;
  }

  @override
  set observableFuture(
      ObservableFuture<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
          value) {
    _$observableFutureAtom.reportWrite(value, super.observableFuture, () {
      super.observableFuture = value;
    });
  }

  late final _$deliveriesMapStreamAtom = Atom(
      name: '_DeliveryHistoryControllerBase.deliveriesMapStream',
      context: context);

  @override
  ObservableMap<DateTime, ObservableStream<QuerySnapshot<Map<String, dynamic>>>>
      get deliveriesMapStream {
    _$deliveriesMapStreamAtom.reportRead();
    return super.deliveriesMapStream;
  }

  @override
  set deliveriesMapStream(
      ObservableMap<DateTime,
              ObservableStream<QuerySnapshot<Map<String, dynamic>>>>
          value) {
    _$deliveriesMapStreamAtom.reportWrite(value, super.deliveriesMapStream, () {
      super.deliveriesMapStream = value;
    });
  }

  late final _$statusMapAtom =
      Atom(name: '_DeliveryHistoryControllerBase.statusMap', context: context);

  @override
  ObservableMap<DeliveryStatus, int> get statusMap {
    _$statusMapAtom.reportRead();
    return super.statusMap;
  }

  @override
  set statusMap(ObservableMap<DeliveryStatus, int> value) {
    _$statusMapAtom.reportWrite(value, super.statusMap, () {
      super.statusMap = value;
    });
  }

  late final _$deliveryQuantityAtom = Atom(
      name: '_DeliveryHistoryControllerBase.deliveryQuantity',
      context: context);

  @override
  int get deliveryQuantity {
    _$deliveryQuantityAtom.reportRead();
    return super.deliveryQuantity;
  }

  @override
  set deliveryQuantity(int value) {
    _$deliveryQuantityAtom.reportWrite(value, super.deliveryQuantity, () {
      super.deliveryQuantity = value;
    });
  }

  @override
  String toString() {
    return '''
currentDateTime: ${currentDateTime},
deliveriesMap: ${deliveriesMap},
observableFuture: ${observableFuture},
deliveriesMapStream: ${deliveriesMapStream},
statusMap: ${statusMap},
deliveryQuantity: ${deliveryQuantity}
    ''';
  }
}
