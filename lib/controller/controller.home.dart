import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/models/category.dart';
import 'package:mobx/mobx.dart';
part 'controller.home.g.dart';

class ControllerHome = ControllerHomeBase with _$ControllerHome;

abstract class ControllerHomeBase with Store {
  ObservableList<Transaction> transactionList = ObservableList<Transaction>();
  //ObservableList<Category> CategoryFavoriteList = ObservableList<Category>();

  @action
  void setTransAction(Transaction trans) {
    transactionList.add(trans);
    setOrder();
  }

  @action
  void removeTransAction(int index) {
    transactionList.removeAt(index);
    setOrder();
  }

  @computed
  double get total {
    double valorTotal = 0;

    for (var element in transactionList) {
      valorTotal += element.value;
    }

    return valorTotal;
  }

  setOrder() {
    transactionList
        .sort((a, b) => b.data.toString().compareTo(a.data.toString()));
  }
}
