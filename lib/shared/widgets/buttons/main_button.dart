import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final String title;
  final Function() callback;
  const MainButtonWidget(
      {super.key, required this.callback, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(232, 46, 90, 1),
        ),
        child: Text(title),
      ),
    );
  }
}
