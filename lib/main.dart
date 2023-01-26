import 'package:flutter/material.dart';
import 'package:green/dependences/dependences.dart';
import 'package:green/model/provider/app_material.dart';
//import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'controller/home_controller.dart';
import 'firebase_options.dart';
//import 'model/provider/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerDependencies();

  runApp(const AppMaterial());
}
