import 'package:flutter/cupertino.dart';

import '../constants/transaction/transaction.dart';

class HomeController extends ChangeNotifier {
  final List<Transaction> transactionList = [];

  void setTransAction(Transaction trans) {
    transactionList.add(trans);
    notifyListeners();
  }

  void removeTransAction(int index) {
    transactionList.removeAt(index);
    notifyListeners();
  }

  double total() {
    double valorTotal = 0;

    for (var element in transactionList) {
      valorTotal += element.value;
    }
    notifyListeners();
    return valorTotal;
  }
}
