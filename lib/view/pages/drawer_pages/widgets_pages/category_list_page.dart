import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/helpers/AppColors.dart';
import 'package:green/helpers/Utils.dart';
import 'package:green/view/pages/drawer_pages/widgets_pages/selected_category_page.dart';

import '../../../../models/category.dart';
import '../drawer_page.dart';
import 'category_cards.dart';

class CategoryListPage extends StatelessWidget {
   CategoryListPage({Key? key}) : super(key: key);
  List<Category>categories=Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
      drawer: Drawer(child: DrawerApp()),
      appBar: AppBar(
        elevation: 0,
        title: Text('Movimentações',style: TextStyle(
            fontFamily: 'sans-serif-light'
        ),),
      ),
      body: Container(

        child: Column(
          children: [
            Expanded(child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                physics:  BouncingScrollPhysics(),
                itemBuilder: (BuildContext context,int index){
return CategoryCard(category: categories[index],
  onCardClick:(){
Navigator.push(context,MaterialPageRoute(builder: (context)=>SelectedCategoryPage()));
  }

);
            }


            ))
          ],
        ),
      )
    );
  }
}
