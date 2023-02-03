// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extract.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExtractController on ExtractControllerBase, Store {
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??= Computed<double>(() => super.total,
          name: 'ExtractControllerBase.total'))
      .value;

  late final _$addAsyncAction =
      AsyncAction('ExtractControllerBase.add', context: context);

  @override
  Future<void> add(Transaction trans) {
    return _$addAsyncAction.run(() => super.add(trans));
  }

  late final _$ExtractControllerBaseActionController =
      ActionController(name: 'ExtractControllerBase', context: context);

  @override
  void setExtract({required List<Transaction> values}) {
    final _$actionInfo = _$ExtractControllerBaseActionController.startAction(
        name: 'ExtractControllerBase.setExtract');
    try {
      return super.setExtract(values: values);
    } finally {
      _$ExtractControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListFilter(DateTime data) {
    final _$actionInfo = _$ExtractControllerBaseActionController.startAction(
        name: 'ExtractControllerBase.setListFilter');
    try {
      return super.setListFilter(data);
    } finally {
      _$ExtractControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTransAction(Transaction trans) {
    final _$actionInfo = _$ExtractControllerBaseActionController.startAction(
        name: 'ExtractControllerBase.removeTransAction');
    try {
      return super.removeTransAction(trans);
    } finally {
      _$ExtractControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total}
    ''';
  }
}
