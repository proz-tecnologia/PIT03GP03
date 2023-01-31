import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/infra/repositories/transaction.repository_impl.dart';
import 'package:green/infra/services/current.state.services.dart';
import 'package:mobx/mobx.dart';

part 'controller.home.g.dart';

class ControllerHome = ControllerHomeBase with _$ControllerHome;

abstract class ControllerHomeBase with Store {
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
    var reponse = await repository.add(trans);

    trans = reponse.data!;

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
        .sort((a, b) => b.data!.toString().compareTo(a.data!.toString()));
  }

  @observable
  CurrentState currentState = CurrentState.empty;

  @action
  void setState({required CurrentState value}) => currentState = value;

  Future<void> initTransaction() async {
    setState(value: CurrentState.loading);
    final transaction = await repository.getCurrent();
    print("LISTA QUE RETORNOU: $transaction");
    setTransactions(values: transaction);
    setState(value: CurrentState.success);
  }
}
