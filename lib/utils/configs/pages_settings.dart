import 'package:flutter/material.dart';
//import 'package:localization/localization.dart';

import '../../view/pages/drawer_pages/my_config.dart';

class ConfiguracoesPage extends StatefulWidget {
  ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    //final loc = context.read<AppSettings>().locale;
    //NumberFormat real =
    //NumberFormat.currency(locale: loc['locale'], name: loc['name']);

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: MyConfig(),
        ));
  }
}
