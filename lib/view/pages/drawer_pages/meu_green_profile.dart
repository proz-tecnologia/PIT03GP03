import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/stores/user.store.dart';
import 'package:green/view/pages/drawer_pages/widgets/menu_languages.dart';
import 'package:localization/localization.dart';
import '../../../app_material.dart';
import '../../../constants/switch_dark.dart';
import '../../../infra/repositories/auth.repository_impl.dart';
import 'meugreen_saldos.dart';

class MeuGreenProfile extends StatefulWidget {
  @override
  _MeuGreenProfileState createState() => _MeuGreenProfileState();
}

class _MeuGreenProfileState extends State<MeuGreenProfile> {
  //final _controller = GetIt.instance.get<ControllerHome>();
  final userStore = GetIt.instance.get<UserStore>();
  final repository = GetIt.instance.get<AuthRepositoryImpl>();
  double aux = 0.0;
  final RegExp verificNumber = RegExp(r'([0-9]{})');
  final fomrKeyLimite = GlobalKey<FormState>();
  //TextEditingController _email = TextEditingController(text: "Green@green.com");
  TextEditingController dateOfBirth = TextEditingController(text: "01-12-1980");
  TextEditingController password = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "settings".i18n(),
          style: TextStyle(fontSize: 13, fontFamily: 'sans-serif-light'),
        ),
      ),
      body: Observer(builder: (context) {
        return Container(
          child: Form(
            key: fomrKeyLimite,
            child: getBody(),
          ),
          //getBody(),
        );
      }),
    );
  }

  Widget getBody() {
    final userStore = GetIt.instance.get<UserStore>();
    //var size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            foregroundColor: Colors.green,
            backgroundColor: Colors.white,
            radius: 60,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text(
                "hello".i18n([userStore.profile!.firstName]),
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sans-serif-light',
                    fontSize: 30),
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                '${"current_limit".i18n()} ${"money".i18n()} ${userStore.profile!.limite.toStringAsFixed(2)}",',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'sans-serif-light',
                    fontSize: 15),
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Column(
              children: [
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MeuGreenCarteira()));
                    });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.payment_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    title: Text("update_limit".i18n()),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: Color.fromARGB(255, 201, 224, 207),
                      builder: (BuildContext context) {
                        return MenuLanguages(
                          onTap: (locale) {
                            final myApp = context
                                .findAncestorStateOfType<AppMaterialState>()!;
                            myApp.changeLocale(locale);
                          },
                        );
                      },
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.language,
                      size: 22,
                      color: Colors.grey,
                    ),
                    title: Text("language".i18n()),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Themes()));
                    });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.brightness_2_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    title: Text("themes".i18n()),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      size: 22,
                      color: Colors.grey,
                    ),
                    title: Text("about".i18n()),
                    trailing: Icon(Icons.question_mark),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          child: Column(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent)),
              onPressed: () {},
              child: Text(
                "logout".i18n(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
