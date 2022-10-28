import 'package:flutter/material.dart';
import 'package:green/modules/HomePage/pages/pagamentos.dart';
import 'package:green/modules/HomePage/pages/todo_list.dart';
import 'package:iconsax/iconsax.dart';
import 'Metas.dart';
import 'config_Users.dart';
import 'drawer_item.dart';
import 'meuGreen.dart';
import 'myCard.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
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
                  name: "Metas",
                  icon: Iconsax.cloud,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                DrawerItem(
                  name: "Pagamentos",
                  icon: Iconsax.money,
                  onPressed: () => onItemPressed(context, index: 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Meu Green",
                  icon: Iconsax.chart_3,
                  onPressed: () => onItemPressed(context, index: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Meus Cartões",
                  icon: Iconsax.card5,
                  onPressed: () => onItemPressed(context, index: 3),
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Lista de Tarefas",
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
                  name: "Configurações",
                  icon: Iconsax.setting,
                  onPressed: () => onItemPressed(context, index: 5),
                ),
                DrawerItem(
                  name: "Sair",
                  icon: Iconsax.logout,
                  onPressed: () => onItemPressed(context, index: 0),
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
            context, MaterialPageRoute(builder: (context) => const Metas()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TransActionPage()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MeuGreen()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyCard()));
        break;

      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeApp()));
        break;

      case 5:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ConfigUsers()));
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
          children: const [
            Text('Olá GREEN',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: Colors.white)),
            SizedBox(width: 20),
            Text('green@green.com',
                style: TextStyle(fontSize: 13, color: Colors.white)),
          ],
        )
      ],
    );
  }
}
