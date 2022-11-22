import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../posicao.dart';

class GreenRepository extends ChangeNotifier {
  late Database db;

  List<Posicao> _saldo = [];
  double _saldo = 0;

  get saldo => _saldo;
}
