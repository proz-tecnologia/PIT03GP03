import 'dart:ui';

class Category{

  String  name;
  Color color;
  String assetsName;
  int categoryId=0;
List<Category>?subCategories;

  Category( {required this.name,  required this.color, required this.assetsName,this.subCategories,required categoryId});
}
