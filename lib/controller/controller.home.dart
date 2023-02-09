import 'package:get_it/get_it.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/controller/extract.controller.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/helpers/Utils.dart';
import 'package:green/infra/repositories/transaction.repository_impl.dart';
import 'package:green/models/bar_char.models.dart';
import 'package:green/models/category.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

part 'controller.home.g.dart';

class ControllerHome = ControllerHomeBase with _$ControllerHome;

abstract class ControllerHomeBase with Store {
  final ExtractController controller = GetIt.I.get();
  final TransactionRepositoryImpl repository;

  ControllerHomeBase(this.repository);

  @observable
  ObservableList<Transaction> transactionList = ObservableList<Transaction>();

  @observable
  ObservableList<Category> listFavoriteCategories = ObservableList<Category>();

  @observable
  ObservableList<Category> categoriesList = ObservableList<Category>();

  @observable
  ObservableList<BarCharModel> chartList = ObservableList<BarCharModel>();

  @action
  void addFavorite(Category favorite) {
    listFavoriteCategories.add(favorite);
    Mensagens.sucess('${"add_favorites".i18n([favorite.name])}');
  }

  @action
  void removeFavorite(Category favorite) {
    listFavoriteCategories
        .removeWhere((element) => element.name == favorite.name);
    Mensagens.alert('${"remove_favorites".i18n([favorite.name])}');
  }

  @action
  void setTransactions({required List<Transaction> values}) {
    transactionList.clear();
    transactionList.addAll(values);
    setOrder();
  }

  @action
  void favoriteCategorie(int index) {
    var isFavorite = categoriesList[index].isFavorited;
    categoriesList[index].isFavorited = !isFavorite;

    if (categoriesList[index].isFavorited) {
      addFavorite(categoriesList[index]);
    } else {
      removeFavorite(categoriesList[index]);
    }
  }

  @action
  void initCategorie() {
    List<Category> categories = Utils.getMockedCategories();
    categoriesList.addAll(categories);
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

    //transactionList.fold(0, (totalValue, item) => totalValue += item.value);
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
    initCategorie();
  }

  @action
  void initChart() {
    chartList.clear();

    var data = Utils.getMockedChart();

    chartList.addAll(data);

    for (var element in transactionList) {
      //print(element.categorie);
      if (element.categorie == 'Refeições') {
        chartList[0].total += element.value;
      } else if (element.categorie == 'Transporte') {
        chartList[1].total += element.value;
      } else if (element.categorie == 'Contas') {
        chartList[2].total += element.value;
      } else if (element.categorie == 'Casa') {
        chartList[3].total += element.value;
      } else if (element.categorie == 'Shopping') {
        chartList[4].total += element.value;
      } else if (element.categorie == 'Streaming') {
        chartList[5].total += element.value;
      } else if (element.categorie == 'Saúde') {
        chartList[6].total += element.value;
      } else {
        chartList[7].total += element.value;
      }
    }
  }
}
