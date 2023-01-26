import 'package:green/constants/transaction/transactions_green.dart';
import 'package:mobx/mobx.dart';
part 'controller.home.g.dart';

class ControllerHome = ControllerHomeBase with _$ControllerHome;

abstract class ControllerHomeBase with Store {
  ObservableList<Transaction> transactionList = ObservableList<Transaction>();

  @action
  void setTransAction(Transaction trans) {
    transactionList.add(trans);
  }

  @action
  void removeTransAction(int index) {
    transactionList.removeAt(index);
  }

  @computed
  double get total {
    double valorTotal = 0;

    for (var element in transactionList) {
      valorTotal += element.value;
    }

    return valorTotal;
  }
}
