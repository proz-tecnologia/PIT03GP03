import 'package:flutter/material.dart';
import 'package:green/controller/home_controller.dart';
import 'package:green/view/pages/drawer_pages/widgets/Meu_green_transactions_list.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_todo.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';


import '../../../utils/configs/pages_settings.dart';
import '../login/login_page.dart';
import 'drawer_item.dart';
//import 'metas.dart';
import 'meuGreen.dart';
import 'meu_green_balance.dart';
import 'meu_green_metas.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    double limite = Provider.of<HomeController>(context, listen: false).limite;
    double total = Provider.of<HomeController>(context, listen: false).total;

    return Drawer(
      child: Material(
        child: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "goals".i18n(),
                  icon: Iconsax.cloud,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                DrawerItem(
                  name: "payments".i18n(),
                  icon: Iconsax.money,
                  onPressed: () => onItemPressed(context, index: 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "my_green".i18n(),
                  icon: Iconsax.chart_3,
                  onPressed: () => onItemPressed(context, index: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "my_cards".i18n(),
                  icon: Iconsax.card5,
                  onPressed: () => onItemPressed(context, index: 3),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "todo_list".i18n(),
                  icon: Iconsax.book,
                  onPressed: () => onItemPressed(context, index: 4),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  height: 20,
                  color: Colors.white,
                ),
                DrawerItem(
                  name: "settings".i18n(),
                  icon: Iconsax.setting,
                  onPressed: () => onItemPressed(context, index: 5),
                ),
                DrawerItem(
                  name: "logout".i18n(),
                  icon: Iconsax.logout,
                  onPressed: () => onItemPressed(context, index: 6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MyHeaderDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/avatar.png'),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MeuGreenMetas()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MeuGreenTransactionsList()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RootApp()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MeuGreenPag()));
        break;

      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MeuGreenTodo()));
        break;

      case 5:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConfiguracoesPage()));
        break;

      case 6:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
        break;

      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage:
              AssetImage('assets/avatar.png'), // modificar para o usuario final
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hello'.i18n(['GREEN']),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: Colors.white)),
            SizedBox(width: 20),
            const Text('green@green.com',
                style: TextStyle(fontSize: 13, color: Colors.white)),
          ],
        )
      ],
    );
  }
}
