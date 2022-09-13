import 'package:flutter/material.dart';

class MyRadioButtonWidget extends StatelessWidget {
  final bool initialValue;
  final String title;
  const MyRadioButtonWidget(
      {super.key, required this.initialValue, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: initialValue ? Colors.red : Colors.white,
              border: Border.all(color: Colors.red, width: 1.5),
              shape: BoxShape.circle),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 15,
          ),
        ),
        Text(title)
      ],
    );
  }
}
