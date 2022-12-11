
import 'package:flutter/material.dart';
import 'package:green/model/Category.dart';

class CounterPage extends StatelessWidget {
  final Category category;
  const CounterPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),

      ),
    );
  }
}
