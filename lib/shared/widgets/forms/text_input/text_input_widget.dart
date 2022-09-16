import 'package:edge_delivery/shared/widgets/forms/text_input/text_input_widget_controller.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType type;
  final bool isObuscured;

  const TextInputWidget(
      {super.key,
      required this.label,
      required this.hint,
      required this.type,
      required this.isObuscured});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  TextInputController controller = TextInputController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: widget.type,
        obscureText: widget.isObuscured,
        decoration: InputDecoration(
          label: Text(widget.label),
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        onChanged: controller.setContent,
      ),
    );
  }
}
