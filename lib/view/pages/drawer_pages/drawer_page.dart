import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/infra/repositories/auth.repository_impl.dart';
import 'package:green/stores/user.store.dart';
import 'package:green/view/pages/drawer_pages/widgets/Meu_green_transactions_list.dart';
import 'package:green/view/pages/drawer_pages/widgets/pagamentos.dart';
import 'package:iconsax/iconsax.dart';
import 'package:localization/localization.dart';
import 'drawer_item.dart';
import 'meuGreen.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    final _controller = GetIt.instance.get<ControllerHome>();
    final userStore = GetIt.instance.get<UserStore>();
    final repository = GetIt.instance.get<AuthRepositoryImpl>();

    return Drawer(
      child: Material(
        child: Container(
          color: (userStore.profile!.limite - _controller.total) >= 0 == true
              ? Colors.green
              : Colors.red,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(
                    name: userStore.profile!.firstName, email: userStore.email),
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
                  onPressed: () async {
                    await repository.logout();
                    userStore.unloadUser();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (Route<dynamic> route) => false);
                  },
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

  Future<void> onItemPressed(BuildContext context, {required int index}) async {
    final userStore = GetIt.instance.get<UserStore>();

    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/metas');
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MeuGreenTransactionsList()));
        break;

      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RootApp()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pagamentos()));
        break;

      case 4:
        Navigator.pushNamed(context, '/extrato');
        break;

      case 5:
        Navigator.pushNamed(context, '/config');
        break;

      case 6:
        //Navigator.pushNamed(context, '/login');
        userStore.unloadUser();
        Navigator.pushReplacementNamed(context, '/login');
        break;

      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget({required String name, String? email = ""}) {
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
            Text('hello'.i18n([name]),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: Colors.white)),
            SizedBox(width: 20),
            Text(email!, style: TextStyle(fontSize: 13, color: Colors.white)),
          ],
        )
      ],
    );
  }
}
