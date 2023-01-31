import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:green/stores/user.store.dart';

class TransactionService {
  Future<QuerySnapshot> getCurrent() async {
    final userStore = GetIt.instance.get<UserStore>();

    final db = FirebaseFirestore.instance;

    final querySnapshot = await db
        .collection("profiles")
        .doc(userStore.uid)
        .collection(userStore.profile!.faturaAtual)
        .get();

    return querySnapshot;
  }

  Future<DocumentReference> add(Map<String, dynamic> map) async {
    final userStore = GetIt.instance.get<UserStore>();

    final db = FirebaseFirestore.instance;

    final docRef = await db
        .collection("profiles")
        .doc(userStore.uid)
        .collection(userStore.profile!.faturaAtual)
        .add(map);

    return docRef;
  }

  Future<bool> remove(String uid) async {
    final userStore = GetIt.instance.get<UserStore>();

    final db = FirebaseFirestore.instance;

    await db
        .collection("profiles")
        .doc(userStore.uid)
        .collection(userStore.profile!.faturaAtual)
        .doc(uid)
        .delete();

    return true;
  }
}
