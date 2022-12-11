import 'package:flutter/cupertino.dart';

class Category with ChangeNotifier{
  final String id;
  final String name;
  final String image;
  bool isFavorite;

  Category({required this.id, required this.name, required this.image, this.isFavorite=false});
  void toggleFavorite(){
    isFavorite= !isFavorite;
    notifyListeners();
}

}