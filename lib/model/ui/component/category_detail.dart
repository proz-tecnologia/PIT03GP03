import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/model/Category.dart';

class CategoryDetailPage extends StatelessWidget {
  final Category category;
  const CategoryDetailPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),

      ),
    );
  }
}
