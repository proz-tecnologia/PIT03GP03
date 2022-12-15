
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/home_controller.dart';
import 'model/provider/app_provider.dart';


void main() async {
  runApp(
    MultiProvider(providers: [
      //ChangeNotifierProvider(create: (_)=>CategoryList()),
      ChangeNotifierProvider(create: (context) => HomeController()),
    ], child: AppProvider()),
  );
}
