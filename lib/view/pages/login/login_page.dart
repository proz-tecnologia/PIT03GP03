import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green/view/pages/login/signup_page_login.dart';
import 'package:localization/localization.dart';

import '../../../constants/credential/users_credential.dart';
import '../home_page/homepage.dart';
import 'Widgets/input_login_widgets.dart';
import 'Widgets/text_button_expand_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _formKey = GlobalKey<FormState>();
  //String _email = "";
  //String _password = "";
  UserCredential? _userCredential;
  //bool _canShowPassword = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.green));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.green,
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
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome'.i18n(),
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => const SignUp()));
                          });
                        }, child: Text('accounts_up'.i18n(),style: TextStyle(fontSize: 15),),
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

  void navigateToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const HomePage2(),
        settings: RouteSettings(arguments: _userCredential)));
  }
}
