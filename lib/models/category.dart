import 'dart:ui';

class Category{
  String  name;
  Color color;
  String assetsName;

List<Category>?subCategories;

  Category({required this.name,  required this.color, required this.assetsName,this.subCategories});
}
