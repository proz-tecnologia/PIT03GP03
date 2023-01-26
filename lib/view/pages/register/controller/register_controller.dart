import 'package:flutter/material.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/infra/repositories/auth.repository_impl.dart';

class RegisterController {
  final AuthRepositoryImpl _authRepository;

  RegisterController(this._authRepository);

  //final userStore = GetIt.instance.get<UserStore>();

  Future<void> doRegister(String name, String email, String password,
      double limite, BuildContext context) async {
    final result =
        await _authRepository.createUser(name, email, password, limite);

    if (result.data != null) {
      Loader.hide();
      Mensagens.sucess("Cadastro realizado com sucesso!!");
      Navigator.pop(context);
    }

    //print("Result: $result\n");
    /*if (result.data != null) {
      userStore.setUser(result.data!, email);
      final profile = Profile(fullName: name);
      userStore.setUserProfile(profile);
      return APIResponse.success(true);
    } else {
      return APIResponse.error("Ops! Algum problema aconteceu!");
    }*/
  }
}


/*

Metódo alternativo
Future<void> register(
      {required String email, required String password}) async {
    try {
      Loader.show("Cadastrando...");
      await _userService.register(email, password);
      Loader.hide();
    } on UserExistsExceptions {
      Loader.hide();
      Mensagens.alert("Email já utilizado, por favor escolha outro");
    } catch (e, s) {
      _log.error("Error ao registrar usuário", e, s);
      Loader.hide();
      Mensagens.alert("Erro ao registrar usuário");
    }
  }

*/