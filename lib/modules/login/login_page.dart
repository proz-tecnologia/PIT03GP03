import 'package:flutter/material.dart';

import 'Widgets/input_login_widgets.dart';
import 'Widgets/text_button_expand_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.greenAccent,
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.8,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bem vindos a GREEN!',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Matenha suas contas em dia! ',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      InputLoginWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      TextButtonExpanded(label: 'esqueceu a senha'),
                      CreaterAcount(label: ' cadastro'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
