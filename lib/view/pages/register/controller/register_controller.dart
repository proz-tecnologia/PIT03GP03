import 'package:flutter/material.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/infra/repositories/auth.repository_impl.dart';

class RegisterController {
  final AuthRepositoryImpl _authRepository;
  String name = '';
  String email = '';
  String password = '';
  double value = 0.0;
  RegisterController(this._authRepository);

  //final userStore = GetIt.instance.get<UserStore>();

  Future<void> doRegister(BuildContext context) async {
    final result =
        await _authRepository.createUser(name, email, password, value);

    if (result.data != null) {
      Loader.hide();
      Mensagens.sucess("Cadastro realizado com sucesso!!");
      Navigator.pop(context);
    }
  }
}
