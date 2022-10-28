import 'package:flutter/material.dart';
import 'package:green/modules/login/login_page.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'khang'),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
      },
    );
  }
}
