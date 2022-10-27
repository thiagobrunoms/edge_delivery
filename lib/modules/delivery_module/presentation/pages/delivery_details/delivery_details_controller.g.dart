// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeliveryDetailsPageController
    on _DeliveryDetailsPageControllerBase, Store {
  Computed<ObservableStream<Delivery>>? _$listenToDeliveryComputed;

  @override
  ObservableStream<Delivery> get listenToDelivery =>
      (_$listenToDeliveryComputed ??= Computed<ObservableStream<Delivery>>(
              () => super.listenToDelivery,
              name: '_DeliveryDetailsPageControllerBase.listenToDelivery'))
          .value;

  late final _$deliveryIdAtom = Atom(
      name: '_DeliveryDetailsPageControllerBase.deliveryId', context: context);

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

  late final _$_DeliveryDetailsPageControllerBaseActionController =
      ActionController(
          name: '_DeliveryDetailsPageControllerBase', context: context);

  @override
  void setDeliveryId(String deliveryId) {
    final _$actionInfo = _$_DeliveryDetailsPageControllerBaseActionController
        .startAction(name: '_DeliveryDetailsPageControllerBase.setDeliveryId');
    try {
      return super.setDeliveryId(deliveryId);
    } finally {
      _$_DeliveryDetailsPageControllerBaseActionController
          .endAction(_$actionInfo);
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
