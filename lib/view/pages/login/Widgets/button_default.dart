// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double padding;
  final double width;
  final double heigth;

  const ButtonDefault({
    Key? key,
    this.onPressed,
    required this.label,
    this.padding = 10,
    this.width = double.infinity,
    this.heigth = 72,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 125, 178, 139),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
