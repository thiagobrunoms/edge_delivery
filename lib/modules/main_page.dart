import 'package:edge_delivery/modules/delivery_module/presentation/widgets/my_radio_button_widget.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/widgets/radio_management.dart';
import 'package:edge_delivery/modules/delivery_module/presentation/widgets/slider_input_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('buildin main');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tela inicial'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SliderInputWidget(initialValue: 30.0),
              RadioManagement()
            ],
          ),
        ));
  }
}
