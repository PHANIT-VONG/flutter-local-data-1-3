import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.labelText = 'Label',
    required this.controller,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
