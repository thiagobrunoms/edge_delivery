import 'package:edge_delivery/modules/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DefaultAppBar extends StatefulWidget {
  const DefaultAppBar({super.key});

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  late SessionController sessionController;

  @override
  void initState() {
    super.initState();

    sessionController = Modular.get<SessionController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sessionController.userEntity.name),
          const Icon(Icons.menu)
        ],
      ),
    );
  }
}