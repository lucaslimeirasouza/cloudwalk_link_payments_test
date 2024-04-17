import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Key textfieldKey;
  final TextEditingController controller;
  final String hintText;

  const TextFormFieldWidget({
    super.key,
    required this.textfieldKey,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      validator: (value) {
        if (value!.length > 8) {
          return 'Somente 8 dígitos';
        }
        return null;
      },
    );
  }
}
