import 'package:flutter/material.dart';

import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

//import '../../../../model/mocks/subCategory.dart';

class SelectedCategoryPage extends StatefulWidget {
  SubCategory subcategory;
  SelectedCategoryPage({required this.subcategory});

  @override
  State<SelectedCategoryPage> createState() => _SelectedCategoryPageState();
}

class _SelectedCategoryPageState extends State<SelectedCategoryPage> {
  @override
  Widget build(BuildContext context) {
    //List<subCategory>sub=[];
    return Scaffold(
        body: Container(
      child: Center(
        child: Text(''),
      ),
    ));
  }
}
