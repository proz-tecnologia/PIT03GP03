import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/models/category.dart';

class SelectCategory extends StatelessWidget {

Category selectCategory;
SelectCategory({required this.selectCategory}) ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Center(
          child: Text(this.selectCategory.name)),
        ),
      );

  }
}
