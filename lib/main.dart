import 'package:flutter/material.dart';

import 'modules/HomePage/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green',
      theme: ThemeData(
        primarySwatch:Colors.green,
        fontFamily: 'khang'

      ),
      home: const HomePage2()
    );
  }
}