import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class InputLoginWidget extends StatefulWidget {
  const InputLoginWidget({Key? key}) : super(key: key);

  @override
  State<InputLoginWidget> createState() => _InputLoginWidgetState();
}

class _InputLoginWidgetState extends State<InputLoginWidget> {
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
                ? 'Not a valid email.'
                : null,
            decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
          TextFormField(
            validator: (String? val) => (val!.length < 4 || val.isEmpty)
                ? 'Password too short..'
                : null,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Senha",
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
                    var message = 'Login invalido';

                    if (formValid) {
                      message = "Login efetuado com sucesso";
                    }

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 125, 178, 139),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    'Login',
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
}