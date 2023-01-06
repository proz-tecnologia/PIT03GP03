import 'dart:ui';
import 'package:green/models/category.dart';
import '../../../../models/category_options.dart';

class Subcategory extends Category {
  //  List<CategoryOption>catOption;


  Subcategory({

    //required this.catOption,
    required Color color,
    required String name,
    required String assetsName, required List<CategoryOption> catOption,

  }) : super(color: color, name: name, assetsName: assetsName);
}