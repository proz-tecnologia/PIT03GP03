// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:green/core/exceptions/failure.dart';
import 'package:green/core/exceptions/user_exists_exceptions.dart';
import 'package:green/core/exceptions/user_not_exists_exception.dart';
import 'package:green/core/logger/app_logger_impl.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/infra/repositories/auth.repository.dart';
import 'package:green/infra/services/auth.service.dart';
import 'package:green/models/api_response.dart';
import 'package:green/models/profile_model.dart';
import 'package:green/stores/user.store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localization/localization.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _service;
  final AppLoggerImpl _logger;

  AuthRepositoryImpl(this._service, this._logger);

  final userStore = GetIt.instance.get<UserStore>();

  @override
  bool checkIfUserLogged() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<APIResponse<String?>> createUser(
      String fullName, String email, String password, double limite) async {
    try {
      final response =
          await _service.createUser(fullName, email, password, limite);

      return APIResponse.success(response);
    } on UserExistsExceptions {
      Loader.hide();
      Mensagens.alert("email_already".i18n());
    } catch (e, s) {
      _logger.error("Error ao registrar usuário!", e, s);
      Loader.hide();
      Mensagens.alert("error_register".i18n());
    }

    return APIResponse.error("Erro ao registrar usuário!");
  }

  @override
  Future<APIResponse<User?>> doLogin(String email, String password) async {
    try {
      final response = await _service.doLogin(email, password);

      final uid = response!.uid;

      userStore.setUser(uid, email);

      final result = await FirebaseFirestore.instance
          .collection("profiles")
          .doc(uid)
          .get();

      var prof = result.data();

      String name = prof!["full_name"];

      double limite = prof["limite"];

      String fatura = prof["fatura_atual"];

      int dia = prof['dia_limite'];

      final profile = Profile(
          fullName: name,
          limite: limite,
          diaFechamento: dia,
          faturaAtual: fatura);

      userStore.setUserProfile(profile);

      return APIResponse.success(response);
    } on Failure catch (e, s) {
      final errorMessage = e.message ?? 'Erro ao realizar login';
      _logger.error(errorMessage, e, s);
      Loader.hide();
      Mensagens.alert(errorMessage);
    } on UserNotExistsException catch (e, s) {
      final errorMessage = "Usuário não encontrado";
      _logger.error(errorMessage, e, s);
      Loader.hide();
      Mensagens.alert(errorMessage);
    }

    return APIResponse.error("");
  }

  @override
  User getUser() {
    final user = _service.getUser();
    if (user != null) {
      return user;
    } else {
      throw Exception("Usuário não logado!");
    }
  }

  @override
  Future<APIResponse<bool>> logout() async {
    final result = await _service.logout();
    return APIResponse.success(result);
  }
}
