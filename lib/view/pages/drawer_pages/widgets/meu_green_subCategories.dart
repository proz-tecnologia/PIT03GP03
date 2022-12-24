import 'dart:ui';
import 'package:green/models/category.dart';
import '../../../../models/category_options.dart';

class Subcategory extends Category {
  List<CategoryOption>catOption;

Subcategory({
  required this.catOption,
  required String  name,
  required Color  color,
  required String  assetsName
}) : super(  name: name,    color:color,  assetsName: assetsName);
}