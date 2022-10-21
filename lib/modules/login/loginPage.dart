import 'package:flutter/material.dart';
import 'Widgets/input_text_widgets.dart';
import 'Widgets/textButton_expand_widget.dart';

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
                padding: EdgeInsets.only(top: 40, left: 32, right: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Bem vindos a GREEN!',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Matenha suas contas em dia! ',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 16),

                        InputTextWidget(label: 'EMAIL',),
                      SizedBox(height: 10),
                       InputTextWidget(label: 'SENHA'),
                       SizedBox(
                        height: 20,
                      ),
                      textButton_login(label:'Entrar'),
                      SizedBox(
                        height: 20,
                      ),

                      TextButtonExpanded(label: 'recuperar senha'),
                      CreaterAcount(
                          label:' cadastro'),


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





