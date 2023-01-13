import 'package:flutter/cupertino.dart';
import 'package:green/models/category.dart';

import '../../../../constants/json/meugreen.dart';

class  CategoryCard extends StatelessWidget {
  CategoryCard({required this.category ,required this.onCardClick});
Category category;
Function onCardClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

this.onCardClick();
      },



      child: Container (
      margin: EdgeInsets.all(20),
      height: 150,
      width: 150,
      child: Column(
      children: [
      Positioned(
      child: Image.asset('assets/'+this.category.assetsName+'.png',fit: BoxFit.contain),
      ),
      SizedBox(
      height: 10,
      ),
      Text(this.category.name,style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',fontWeight: FontWeight.bold),)
      ],
  ),
  ),
    );
  }
}
