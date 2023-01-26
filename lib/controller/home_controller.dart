/*import 'package:flutter/foundation.dart';
import 'package:green/model/meu_green_category.dart';

import '../constants/transaction/transactions_green.dart';

class HomeController extends ChangeNotifier {
  double _limite = 00.00;

  final List<Transaction> transactionList = [];
  final List<GreenList> categories = [];

  double get limite => _limite;

  void mudarLimite(double limite) {
    if (limite > 0) {
      _limite = limite;
    }
    notifyListeners();
  }

  void setTransAction(Transaction trans) {
    transactionList.add(trans);

    notifyListeners();
  }

  List<Transaction> get transaction => transactionList;
  final List<Transaction> _extratoProvider = [];

  TransactionController() {
    _extratoProvider.sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }

  List<Transaction> get extratoProvider => _extratoProvider;

  double get total {
    double valorTotal = 0;

    for (var element in transactionList) {
      valorTotal += element.value;
    }
    notifyListeners();
    return valorTotal;
  }

  void add(Transaction item) {
    transaction.add(item);
    transaction.sort(((a, b) => b.dateTime.compareTo(a.dateTime)));
    notifyListeners();
  }

  void removeTransAction(int index) {
    transactionList.removeAt(index);
    notifyListeners();
  }
}
*/


 /*
double get getTotalIncoming {
    double value = 0;
    var filtered = transaction
        .where((element) => element.transactionType == TransactionType.INCOME);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }
 
 
 double get getTotalOutcoming {
    double value = 0;
    var filtered = transaction
        .where((element) => element.transactionType == TransactionType.EXPENSE);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }*/