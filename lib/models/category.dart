import 'dart:ui';

import '../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class Category{
  List<SubCategory>subCategory;
  String  name;
  Color color;
  String assetsName;


  Category( {required this.name,  required this.color, required this.assetsName,required this.subCategory,
  });
}

