import 'package:flutter/cupertino.dart';
import 'package:green/models/transaction/transaction.dart';

class HomeController extends ChangeNotifier {
  final List<Transaction> transactionList = [];

  void setTransAction(Transaction trans) {
    transactionList.add(trans);
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
