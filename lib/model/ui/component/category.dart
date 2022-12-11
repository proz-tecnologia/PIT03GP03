import 'package:uuid/uuid.dart';

class Category {
  String id = const Uuid().v4();
  String name;
  String icon;

  Category(
      {this.name = "Não definido",
      this.icon = ''
          ''});
}
