import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/category_controller.dart';
import 'controller/home_controller.dart';
import 'firebase_options.dart';
import 'model/provider/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [

      //ChangeNotifierProvider(create: (_)=>CategoryList()),
      ChangeNotifierProvider(
          create: (context) => HomeController()),
    ], child: AppProvider()),
  );
}
