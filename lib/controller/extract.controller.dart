import 'package:green/constants/transaction/transactions_green.dart';
import 'package:mobx/mobx.dart';

part 'extract.controller.g.dart';

class ExtractController = ExtractControllerBase with _$ExtractController;

abstract class ExtractControllerBase with Store {
  ObservableList<Transaction> extractList = ObservableList<Transaction>();

  ObservableList<Transaction> extractListFilter = ObservableList<Transaction>();

  @action
  void setExtract({required List<Transaction> values}) {
    extractList.clear();
    extractList.addAll(values);
    setOrder();
  }

  @action
  void setListFilter(DateTime data) {
    extractListFilter.clear();

    for (var element in extractList) {
      if ((element.data!.month == data.month) &&
          (element.data!.year == data.year)) {
        extractListFilter.add(element);
      }
    }
  }

  @action
  Future<void> add(Transaction trans) async {
    extractList.add(trans);
    setOrder();
  }

  @action
  void removeTransAction(int index) {
    extractList.removeAt(index);
    setOrder();
  }

  @computed
  double get total {
    double valorTotal = 0;

    for (var element in extractListFilter) {
      valorTotal += element.value;
    }

    return valorTotal;
  }

  setOrder() {
    extractList
        .sort((a, b) => b.data!.toString().compareTo(a.data!.toString()));
  }
}
