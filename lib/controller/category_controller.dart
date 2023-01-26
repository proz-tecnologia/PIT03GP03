import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class CategoryController extends ChangeNotifier {
  final List<SubCategory> _listSub = [];
  final List<Category> _cat = [];
  UnmodifiableListView<Category> get listSub => UnmodifiableListView(_cat);

  void add(Category cat) {
    _cat.add(cat);
    notifyListeners();
  }
}
