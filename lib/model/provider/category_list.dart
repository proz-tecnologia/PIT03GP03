import 'package:flutter/cupertino.dart';

import '../Category.dart';
import '../data/dummy_data.dart';

class CategoryList with ChangeNotifier{
  List<Category>_items=dummyCategories;
  List <Category>get items=>[..._items];

  void addCategory(Category category){
    _items.add(category);
    notifyListeners();
  }
}