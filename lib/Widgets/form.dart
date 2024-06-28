import 'package:flutter/material.dart';

class AppForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AppForm({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Value missing';
        }
        return null;
      },
    );
  }
}
