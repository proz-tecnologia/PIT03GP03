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
