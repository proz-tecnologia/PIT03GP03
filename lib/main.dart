import 'package:flutter/material.dart';
import 'package:green/dependences/dependences.dart';
import 'package:green/app_material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerDependencies();

  runApp(const AppMaterial());
}
