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

  late final _$ControllerHomeBaseActionController =
      ActionController(name: 'ControllerHomeBase', context: context);

  @override
  void setTransAction(Transaction trans) {
    final _$actionInfo = _$ControllerHomeBaseActionController.startAction(
        name: 'ControllerHomeBase.setTransAction');
    try {
      return super.setTransAction(trans);
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
  String toString() {
    return '''
total: ${total}
    ''';
  }
}
