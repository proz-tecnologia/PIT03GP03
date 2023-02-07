import 'dart:ui';

import '../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class Category {
  int categoryId;
  List<SubCategory> subCategory;
  String name;
  String assetsName;
  Color color;
  bool isFavorited;

  Category({
    required this.categoryId,
    required this.subCategory,
    required this.name,
    required this.assetsName,
    required this.color,
    required this.isFavorited,
  });
}
