import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Key textfieldKey;
  final TextEditingController controller;
  final String hintText;

  const TextFieldWidget({
    super.key,
    required this.textfieldKey,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: textfieldKey,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
