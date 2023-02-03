import 'package:get_it/get_it.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/controller/extract.controller.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/infra/repositories/transaction.repository_impl.dart';
import 'package:mobx/mobx.dart';

part 'controller.home.g.dart';

class ControllerHome = ControllerHomeBase with _$ControllerHome;

abstract class ControllerHomeBase with Store {
  final ExtractController controller = GetIt.I.get();
  final TransactionRepositoryImpl repository;

  ControllerHomeBase(this.repository);

  ObservableList<Transaction> transactionList = ObservableList<Transaction>();
  //ObservableList<Category> CategoryFavoriteList = ObservableList<Category>();

  @action
  void setTransactions({required List<Transaction> values}) {
    transactionList.clear();
    transactionList.addAll(values);
    setOrder();
  }

  @action
  Future<void> add(Transaction trans) async {
    DateTime data = DateTime.now();

    var reponse = await repository.add(trans);

    trans = reponse.data!;

    if ((trans.data!.month == data.month) && (trans.data!.year == data.year)) {
      transactionList.add(trans);
    }

    controller.add(trans);
    setOrder();
  }

  @action
  Future<void> removeTransAction(Transaction trans) async {
    DateTime data = DateTime.now();

    var response = await repository.remove(trans);

    if (response.isSuccess) {
      if ((trans.data!.month == data.month) &&
          (trans.data!.year == data.year)) {
        transactionList.removeWhere((element) => element.id == trans.id);
        setOrder();
      }

      controller.removeTransAction(trans);
    } else {
      Mensagens.alert(response.message!);
    }
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
        .sort((a, b) => b.data!.toString().compareTo(a.data!.toString()));
  }

  Future<void> initTransaction() async {
    DateTime data = DateTime.now();

    List<Transaction> listFiltrada = [];

    final transaction = await repository.getCurrent();

    for (var element in transaction) {
      if ((element.data!.month == data.month) &&
          (element.data!.year == data.year)) {
        listFiltrada.add(element);
      }
    }

    setTransactions(values: listFiltrada);
    controller.setExtract(values: transaction);
  }
}
