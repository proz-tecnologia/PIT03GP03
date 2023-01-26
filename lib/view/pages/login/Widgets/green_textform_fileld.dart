import 'package:flutter/material.dart';

class GreenTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  GreenTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.label,
    this.obscureText = false,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: ((_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          obscureText: obscureTextValue,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(
                      obscureTextValue ? Icons.lock : Icons.lock_open,
                      color: Colors.green,
                    ))
                : null,
          ),
        );
      }),
    );
  }
}
