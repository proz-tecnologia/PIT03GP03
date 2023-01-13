import 'package:flutter/material.dart';

class GreenTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  GreenTextFormField({
    super.key,
    required this.label,
    this.obscureText = false,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: ((_, obscureTextValue, child) {
        return TextFormField(
          obscureText: obscureTextValue,
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
