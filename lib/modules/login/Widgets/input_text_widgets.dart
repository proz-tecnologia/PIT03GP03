
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  const InputTextWidget({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20))),
        ),
      ],
    );
  }
}
