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

  @override
  String toString() {
    return '''
currentDateTime: ${currentDateTime},
deliveriesMapStream: ${deliveriesMapStream},
statusMap: ${statusMap}
    ''';
  }
}
