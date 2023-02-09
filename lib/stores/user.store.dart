import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green/models/profile_model.dart';
import 'package:mobx/mobx.dart';
part 'user.store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @readonly
  String? _uid;

  @readonly
  String? _email;

  @readonly
  Profile? _profile;

  @action
  setUser(String uid, String email) {
    _uid = uid;
    _email = email;
  }

  @action
  Future<void> setNewLimit(double value) async {
    await FirebaseFirestore.instance
        .collection("profiles")
        .doc(_uid)
        .update({'limite': value});

    Profile newProfile = _profile!.copyWith(limite: value);

    setUserProfile(newProfile);
  }

  @action
  setUserProfile(Profile profile) {
    _profile = profile;
  }

  @action
  unloadUser() {
    _uid = null;
    _email = null;
    _profile = null;
  }
}
