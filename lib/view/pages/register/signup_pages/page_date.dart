import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDate extends StatefulWidget {
  const PageDate({Key? key}) : super(key: key);

  @override
  State<PageDate> createState() => _PageDateState();
}

class _PageDateState extends State<PageDate> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Center(child: Text("Date")),
    );
  }
}
