import 'package:flutter/material.dart';
import 'package:green/utils/configs/app_settings2.dart';
import 'package:green/utils/configs/hive_config.dart';
import 'package:provider/provider.dart';

import 'model/provider/app_provider.dart';

// @dart=2.9
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AppSettings()),
    ], child: AppProvider()),
  );
}
