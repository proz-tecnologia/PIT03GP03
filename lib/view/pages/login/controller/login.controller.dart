import 'package:flutter/material.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/infra/repositories/auth.repository_impl.dart';

class LoginController {
  AuthRepositoryImpl _authRepository;

  LoginController(
    this._authRepository,
  );

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Loader.show();

    final response = await _authRepository.doLogin(email, password);

    if (response.data != null) {
      Loader.hide();
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
}
