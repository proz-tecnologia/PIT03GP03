import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import 'app_material.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(),
      child: const AppMaterial(),
    );
  }
}
