import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:green/view/pages/login/Widgets/green_textform_fileld.dart';
import 'package:green/view/pages/login/controller/login.controller.dart';
import 'package:localization/localization.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../constants/credential/users_credential.dart';

import '../../home_page/homepage.dart';

class InputLoginWidget extends StatefulWidget {
  const InputLoginWidget({Key? key}) : super(key: key);

  @override
  State<InputLoginWidget> createState() => _InputLoginWidgetState();
}

class _InputLoginWidgetState extends State<InputLoginWidget> {
  UserCredential? _userCredential;

  final _controller = GetIt.instance.get<LoginController>();

  final _fomrKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fomrKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreenTextFormField(
            label: "email".i18n(),
            controller: _emailEC,
            validator: Validatorless.multiple([
              Validatorless.required('Email obrigatório'),
              Validatorless.email('Email não válido'),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          GreenTextFormField(
            label: 'password'.i18n(),
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'Senha deve conter ao menos 6 caracteres')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    var formValid = _fomrKey.currentState?.validate() ?? false;
                    //var message = 'invalid_login'.i18n();

                    if (formValid) {
                      //message = "valid_login".i18n();

                      await _controller.login(
                          email: _emailEC.text,
                          password: _passwordEC.text,
                          context: context);

                      /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomePage2(),
                          settings: RouteSettings(arguments: _userCredential)));*/
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 125, 178, 139),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    'login'.i18n(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomePage2(),
        settings: RouteSettings(arguments: _userCredential)));
  }
}
