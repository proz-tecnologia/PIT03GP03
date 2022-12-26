import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/models/category.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class SelectCategory extends StatefulWidget {

Subcategory  selectCategory;
SelectCategory({required this.selectCategory}) ;

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              children:[ 
                Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/' + widget.selectCategory.assetsName +'food.png' ),
                        fit: BoxFit.cover
                    )
                ),
                  child: Text('teste'),
              ),
            ])
          ],
        ),

      ),


    );
  }
}
