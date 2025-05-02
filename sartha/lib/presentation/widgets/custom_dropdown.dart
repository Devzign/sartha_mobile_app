import 'package:flutter/material.dart';
import '../themes/app_color.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String labelText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final String? errorText;

  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColor.color93287f),
        border: const OutlineInputBorder(),
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.color93287f,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
