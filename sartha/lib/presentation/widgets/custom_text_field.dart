import 'package:flutter/material.dart';
import '../themes/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.color015ecc,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}