import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../../constants/credential/users_credential.dart';
import '../../../../model/mocks/green_users.dart';
import '../../home_page/homepage.dart';
import '../../onboarding_screen/onboarding.dart';

class InputLoginWidget extends StatefulWidget {
  const InputLoginWidget({Key? key}) : super(key: key);

  @override
  State<InputLoginWidget> createState() => _InputLoginWidgetState();
}

class _InputLoginWidgetState extends State<InputLoginWidget> {
  String _email = "";
  String _password = "";

  UserCredential? _userCredential;

  //bool _canShowPassword = false;

  final fomrKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fomrKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (String? val) => !EmailValidator.validate(val!, true)
                ? 'valid_email'.i18n()
                : null,
            decoration: InputDecoration(
                labelText: "email".i18n(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          TextFormField(
            validator: (String? val) => (val!.length < 4 || val.isEmpty)
                ? 'valid_password'.i18n()
                : null,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "password".i18n(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    var formValid = fomrKey.currentState?.validate() ?? false;
                    var message = 'invalid_login'.i18n();

                    if (formValid) {
                      message = "valid_login".i18n();
                      if (fomrKey.currentState!.validate()) {
                        fomrKey.currentState!.save();

                        _userCredential = MockUsers.getUsers().firstWhereOrNull(
                            (element) =>
                                element.email == _email &&
                                element.password == _password);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const OnBoardingScreen(),
                            settings:
                                RouteSettings(arguments: _userCredential)));
                      }
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
