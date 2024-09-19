import 'package:flutter/material.dart';

class CCTextfield extends StatelessWidget {
  const CCTextfield({
    required this.controller,
    required this.icon,
    required this.validator,
    required this.label,
    this.KeyboardType,
    super.key,
  });
  final TextEditingController controller;
  final Widget icon;
  final String label;
  final String? Function(String?)? validator;
  final KeyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: KeyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hoverColor: Colors.white,
        focusColor: Colors.white,
        fillColor: Colors.white,
        prefixIcon: icon,
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Make the border rounded
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Make the border rounded
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Make the border rounded
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
