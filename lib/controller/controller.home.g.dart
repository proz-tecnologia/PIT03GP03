// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerHome on ControllerHomeBase, Store {
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: 'ControllerHomeBase.total'))
      .value;

  late final _$transactionListAtom =
      Atom(name: 'ControllerHomeBase.transactionList', context: context);

  @override
  ObservableList<Transaction> get transactionList {
    _$transactionListAtom.reportRead();
    return super.transactionList;
  }

  @override
  set transactionList(ObservableList<Transaction> value) {
    _$transactionListAtom.reportWrite(value, super.transactionList, () {
      super.transactionList = value;
    });
  }

  late final _$listFavoriteCategoriesAtom =
      Atom(name: 'ControllerHomeBase.listFavoriteCategories', context: context);

  @override
  ObservableList<Category> get listFavoriteCategories {
    _$listFavoriteCategoriesAtom.reportRead();
    return super.listFavoriteCategories;
  }

  @override
  set listFavoriteCategories(ObservableList<Category> value) {
    _$listFavoriteCategoriesAtom
        .reportWrite(value, super.listFavoriteCategories, () {
      super.listFavoriteCategories = value;
    });
  }

  late final _$categoriesListAtom =
      Atom(name: 'ControllerHomeBase.categoriesList', context: context);

  @override
  ObservableList<Category> get categoriesList {
    _$categoriesListAtom.reportRead();
    return super.categoriesList;
  }

  @override
  set categoriesList(ObservableList<Category> value) {
    _$categoriesListAtom.reportWrite(value, super.categoriesList, () {
      super.categoriesList = value;
    });
  }

  late final _$chartListAtom =
      Atom(name: 'ControllerHomeBase.chartList', context: context);

  @override
  ObservableList<BarCharModel> get chartList {
    _$chartListAtom.reportRead();
    return super.chartList;
  }

  @override
  set chartList(ObservableList<BarCharModel> value) {
    _$chartListAtom.reportWrite(value, super.chartList, () {
      super.chartList = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('ControllerHomeBase.add', context: context);

  @override
  Future<void> add(Transaction trans) {
    return _$addAsyncAction.run(() => super.add(trans));
  }

  late final _$removeTransActionAsyncAction =
      AsyncAction('ControllerHomeBase.removeTransAction', context: context);

  @override
  Future<void> removeTransAction(Transaction trans) {
    return _$removeTransActionAsyncAction
        .run(() => super.removeTransAction(trans));
  }

  late final _$ControllerHomeBaseActionController =
      ActionController(name: 'ControllerHomeBase', context: context);

  @override
  void addFavorite(Category favorite) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.addFavorite');
    try {
      return super.addFavorite(favorite);
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavorite(Category favorite) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.removeFavorite');
    try {
      return super.removeFavorite(favorite);
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTransactions({required List<Transaction> values}) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.setTransactions');
    try {
      return super.setTransactions(values: values);
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void favoriteCategorie(int index) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.favoriteCategorie');
    try {
      return super.favoriteCategorie(index);
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initCategorie() {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.initCategorie');
    try {
      return super.initCategorie();
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initChart() {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.initChart');
    try {
      return super.initChart();
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
transactionList: ${transactionList},
listFavoriteCategories: ${listFavoriteCategories},
categoriesList: ${categoriesList},
chartList: ${chartList},
total: ${total}
    ''';
  }
}
