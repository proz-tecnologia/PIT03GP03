import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../constants/transaction/transactions_green.dart';

class HomeController extends ChangeNotifier {
  final List<Transaction> transactionList = [];
  final List<Category> categories = [];

  void setTransAction(Transaction trans) {
    transactionList.add(trans);
    transactionList.sort(((a, b) => a.dateTime!.compareTo(b.dateTime!)));
    notifyListeners();
  }

  List<Transaction> get transaction => transactionList;

  List<Category> get categorie => categories;

  double get total {
    double valorTotal = 0;

    for (var element in transactionList) {
      valorTotal += element.value;
    }
    notifyListeners();
    return valorTotal;
  }

  double get getTotalIncoming {
    double value = 0;
    var filtered = transactionList
        .where((element) => element.transactionType == TransactionType.INCOME);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }

  double get getTotalOutcoming {
    double value = 0;
    var filtered = transactionList
        .where((element) => element.transactionType == TransactionType.EXPENSE);
    for (var transaction in filtered) {
      value += transaction.value;
    }
    return value;
  }

  void add(Transaction item) {
    transactionList.add(item);
    transactionList.sort(((a, b) => a.dateTime!.compareTo(b.dateTime!)));
    notifyListeners();
  }
}