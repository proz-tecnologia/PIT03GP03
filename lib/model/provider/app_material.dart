import 'package:flutter/material.dart';

import '../../view/pages/splash_screen/splash_Screen.dart';

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
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
