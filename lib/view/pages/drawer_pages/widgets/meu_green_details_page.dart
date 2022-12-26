import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class DetailsPage extends StatefulWidget {

  Subcategory subCategory;

   DetailsPage({required this.subCategory}) ;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/' + widget.subCategory.assetsName + 'food.png')
          )
        ),
      ),


    );
  }
}
