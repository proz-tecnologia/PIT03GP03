import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageValue extends StatefulWidget {
  const PageValue({Key? key}) : super(key: key);

  @override
  State<PageValue> createState() => _PageValueState();
}

class _PageValueState extends State<PageValue> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Center(child: Text("Value")),
    );
  }
}
