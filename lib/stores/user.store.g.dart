// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$_uidAtom = Atom(name: 'UserStoreBase._uid', context: context);

  String? get uid {
    _$_uidAtom.reportRead();
    return super._uid;
  }

  @override
  String? get _uid => uid;

  @override
  set _uid(String? value) {
    _$_uidAtom.reportWrite(value, super._uid, () {
      super._uid = value;
    });
  }

  late final _$_emailAtom =
      Atom(name: 'UserStoreBase._email', context: context);

  String? get email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  String? get _email => email;

  @override
  set _email(String? value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_profileAtom =
      Atom(name: 'UserStoreBase._profile', context: context);

  Profile? get profile {
    _$_profileAtom.reportRead();
    return super._profile;
  }

  @override
  Profile? get _profile => profile;

  @override
  set _profile(Profile? value) {
    _$_profileAtom.reportWrite(value, super._profile, () {
      super._profile = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  dynamic setUser(String uid, String email) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setUser');
    try {
      return super.setUser(uid, email);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserProfile(Profile profile) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setUserProfile');
    try {
      return super.setUserProfile(profile);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic unloadUser() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.unloadUser');
    try {
      return super.unloadUser();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
