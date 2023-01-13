import 'dart:ui';

import '../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class Category{
  List<SubCategory>subCategory;
  String  name;
  String assetsName;
  Color  color;
int qtdSubCat;


  Category( {required this.name,   required this.color, required this.assetsName, required this.subCategory,required this.qtdSubCat
  });
}

