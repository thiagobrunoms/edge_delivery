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
deliveryQuantity: ${deliveryQuantity}
    ''';
  }
}