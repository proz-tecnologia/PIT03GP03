import 'package:flutter/material.dart';
import 'component/category_grid.dart';


class CategoryOverviewPage extends StatelessWidget {
   CategoryOverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text('Favorites') ,
      ),
      body:CategoryGrid()
    );
  }


  }


