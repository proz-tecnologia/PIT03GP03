import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/view/pages/home_page/homepage.dart';
import 'package:green/view/pages/login/login_page.dart';
import 'package:provider/provider.dart';

import '../../../../services/auth_services.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth =Provider.of<AuthService>(context);
if (auth.isLoading)
  return  loading();
else if(auth.usuario ==null)
  return LoginPage();
else
  return  HomePage2();
  }

}
loading(){
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),

  );


}