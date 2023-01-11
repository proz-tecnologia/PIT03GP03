import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/json/meugreen.dart';

class SelectedCategoryPage extends StatelessWidget {
  const SelectedCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Center(
          
          child: Text('Select Categories'),
        ),
      )
      
    );
  }
}
