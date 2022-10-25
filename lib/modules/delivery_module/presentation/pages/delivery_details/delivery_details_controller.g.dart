// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeliveryDetailsController on _DeliveryDetailsControllerBase, Store {
  Computed<ObservableStream<Delivery>>? _$listenToDeliveryComputed;

  @override
  ObservableStream<Delivery> get listenToDelivery =>
      (_$listenToDeliveryComputed ??= Computed<ObservableStream<Delivery>>(
              () => super.listenToDelivery,
              name: '_DeliveryDetailsControllerBase.listenToDelivery'))
          .value;

  late final _$deliveryIdAtom =
      Atom(name: '_DeliveryDetailsControllerBase.deliveryId', context: context);

  @override
  String get deliveryId {
    _$deliveryIdAtom.reportRead();
    return super.deliveryId;
  }

  @override
  set deliveryId(String value) {
    _$deliveryIdAtom.reportWrite(value, super.deliveryId, () {
      super.deliveryId = value;
    });
  }

  late final _$_DeliveryDetailsControllerBaseActionController =
      ActionController(
          name: '_DeliveryDetailsControllerBase', context: context);

  @override
  void setDeliveryid(String deliveryId) {
    final _$actionInfo = _$_DeliveryDetailsControllerBaseActionController
        .startAction(name: '_DeliveryDetailsControllerBase.setDeliveryid');
    try {
      return super.setDeliveryid(deliveryId);
    } finally {
      _$_DeliveryDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryId: ${deliveryId},
listenToDelivery: ${listenToDelivery}
    ''';
  }
}
