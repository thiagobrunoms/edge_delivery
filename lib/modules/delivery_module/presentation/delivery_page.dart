import 'package:edge_delivery/modules/sign_up_module/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  final UserEntity userEntity;
  const DeliveryPage({super.key, required this.userEntity});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [Text('Olá, ${widget.userEntity.name}')],
    )));
  }
}
