import 'package:edge_delivery/modules/delivery_module/presentation/widgets/my_radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RadioManagement extends StatefulWidget {
  const RadioManagement({super.key});

  @override
  State<RadioManagement> createState() => _RadioManagementState();
}

class _RadioManagementState extends State<RadioManagement> {
  bool firstValue = true;
  bool secondValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: update,
          child:
              MyRadioButtonWidget(initialValue: firstValue, title: 'Option 1'),
        ),
        InkWell(
            onTap: update,
            child: MyRadioButtonWidget(
                initialValue: secondValue, title: 'Option 2'))
      ],
    );
  }

  void update() {
    setState(() {
      firstValue = !firstValue;
      print('firstValue -> $firstValue');
      secondValue = !secondValue;
      print('secondValue -> $secondValue');
    });
  }
}
