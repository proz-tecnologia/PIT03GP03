import 'package:flutter/material.dart';

import 'button_default.dart';
import 'green_textform_fileld.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreenTextFormField(label: 'Login'),
          const SizedBox(
            height: 20,
          ),
          GreenTextFormField(
            label: "Senha",
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonDefault(
            label: "Login",
            onPressed: () {},
          ),
          const SizedBox(
            height: 8,
          ),
          const _OrSeparator()
        ],
      ),
    );
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "OU",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
