import 'package:flutter/material.dart';
import 'package:green/view/pages/drawer_pages/widgets/menu_languages.dart';
import 'package:localization/localization.dart';

import '../../../constants/app_text_styles.dart';
import '../../../app_material.dart';
import '../login/login_page.dart';

//NOVO MENU CONFIG
class MyConfig extends StatefulWidget {
  const MyConfig({
    Key? key,
  }) : super(key: key);

  @override
  State<MyConfig> createState() => _MyConfigState();
}

class _MyConfigState extends State<MyConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: //AppBar(elevation: 0),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(5000),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MenuConfig(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuConfig extends StatelessWidget {
  const MenuConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'settings'.i18n(),
              style: AppStyles.write36600Normal,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'help'.i18n(),
            style: AppStyles.write20600Normal,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'about'.i18n(),
            style: AppStyles.write20600Normal,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'themes'.i18n(),
            style: AppStyles.write20600Normal,
          ),
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: Color.fromARGB(255, 201, 224, 207),
              builder: (BuildContext context) {
                return MenuLanguages(
                  onTap: (locale) {
                    final myApp =
                        context.findAncestorStateOfType<AppMaterialState>()!;
                    myApp.changeLocale(locale);
                  },
                );
              },
            );
          },
          child: Text(
            'language'.i18n(),
            style: AppStyles.write20600Normal,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text(
            'logout'.i18n(),
            style: AppStyles.write20600Normal,
          ),
        ),
      ],
    );
  }
}








/*
MENU ANTIGO CONFIG
import 'package:flutter/material.dart';
import 'package:green/view/pages/drawer_pages/widgets/menu_languages.dart';
import 'package:localization/localization.dart';

import '../../../constants/app_text_styles.dart';
import '../../../model/provider/app_material.dart';
import '../login/login_page.dart';

class MyConfig extends StatefulWidget {
  const MyConfig({
    Key? key,
  }) : super(key: key);

  @override
  State<MyConfig> createState() => _MyConfigState();
}

class _MyConfigState extends State<MyConfig> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
              'settings'.i18n(),
              style: AppStyles.green28900Khang18,
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text(
                'help'.i18n(),
                style: AppStyles.green20900Khang18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'about'.i18n(),
                style: AppStyles.green20900Khang18,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'themes'.i18n(),
                style: AppStyles.green20900Khang18,
              ),
            ),
            TextButton(
              onPressed: () {
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
              child: Text(
                'language'.i18n(),
                style: AppStyles.green20900Khang18,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'logout'.i18n(),
                style: AppStyles.green20900Khang18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/