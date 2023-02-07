// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:green/core/exceptions/failure.dart';
import 'package:green/core/exceptions/user_exists_exceptions.dart';
import 'package:green/core/exceptions/user_not_exists_exception.dart';
import 'package:green/core/logger/app_logger_impl.dart';
import 'package:intl/intl.dart';

class AuthService {
  AppLoggerImpl _log;

  AuthService(
    this._log,
  );

  Future<String?> createUser(
      String fullName, String email, String password, double limite) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isNotEmpty) {
        throw UserExistsExceptions();
      }

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final uid = userCredential.user!.uid;
      String fatura = Fatura();

      await FirebaseFirestore.instance.collection("profiles").doc(uid).set({
        "full_name": fullName,
        "limite": limite,
        "fatura_atual": fatura,
        "dia_limite": 5,
        "created_at": FieldValue.serverTimestamp(),
      });

      /*var retorno = await FirebaseFirestore.instance
          .collection("profiles")
          .doc(uid)
          .collection(fatura)
          .add({
        "limbo": "",
      });

      await FirebaseFirestore.instance
          .collection("profiles")
          .doc(uid)
          .collection(fatura)
          .doc(retorno.id)
          .delete();*/

      return uid;
    } on FirebaseException catch (e, s) {
      _log.error("Erro ao criar usuario no firebase", e, s);
      throw Failure(message: "Erro ao criar usuário!");
    }
  }

  bool checkIfUserLogged() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<User?> doLogin(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.isEmpty) {
        throw UserNotExistsException();
      }

      if (loginMethods.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        return userCredential.user!;
      } else {
        throw Failure(message: 'Login não pode ser feito por email e senha');
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error(
          "Email ou senha inválidos!\nFirebaseAuthError[${e.code}]", e, s);
      throw Failure(message: "Email ou senha inválido!!");
    }
  }

  Future<bool> logout() async {
    await FirebaseAuth.instance.signOut();

    return true;
  }

  String Fatura() {
    DateTime data = DateTime.now();

    String newFatura = DateFormat("MMMM'_'y", "pt_BR").format(data).toString();

    return newFatura;
  }

  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
