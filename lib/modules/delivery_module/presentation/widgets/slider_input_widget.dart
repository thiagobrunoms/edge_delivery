import 'package:flutter/material.dart';

class SliderInputWidget extends StatefulWidget {
  final double initialValue;
  const SliderInputWidget({super.key, required this.initialValue});

  @override
  State<SliderInputWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SliderInputWidget> {
  late double sliderValue;

  @override
  void initState() {
    super.initState();

    sliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: sliderValue,
          max: 100.0,
          divisions: 2,
          onChanged: updateSliderValue,
        ),
        Text('Slider value $sliderValue')
      ],
    );
  }

  void updateSliderValue(double newValue) {
    setState(() {
      sliderValue = newValue;
    });
  }
}
