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

  late final _$currentStateAtom =
      Atom(name: 'ControllerHomeBase.currentState', context: context);

  @override
  CurrentState get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(CurrentState value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('ControllerHomeBase.add', context: context);

  @override
  Future<void> add(Transaction trans) {
    return _$addAsyncAction.run(() => super.add(trans));
  }

  late final _$ControllerHomeBaseActionController =
      ActionController(name: 'ControllerHomeBase', context: context);

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
  void removeTransAction(int index) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.removeTransAction');
    try {
      return super.removeTransAction(index);
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState({required CurrentState value}) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.setState');
    try {
      return super.setState(value: value);
    } finally {
      _$ControllerHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
total: ${total}
    ''';
  }
}
