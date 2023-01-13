import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../signup_page_login.dart';

//widget problemas ao fazer o login
class TextButtonExpanded extends StatelessWidget {
  const TextButtonExpanded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              'trouble_logging'.i18n(),
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}

//widget cadastro
class CreaterAcount extends StatelessWidget {
  const CreaterAcount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const SignUp()));
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              'no_account'.i18n(),
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}

//widget login
class TextButtonLogin extends StatelessWidget {
  final String label;

  const TextButtonLogin({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
