import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import '../../helpers/Utils.dart';
import '../../utils/preferences_green.dart';
import '../../view/pages/drawer_pages/widgets/meu_green_select_category.dart';
import '../../view/pages/splash_screen/splash_Screen.dart';


class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key});

  @override
  State<AppMaterial> createState() => AppMaterialState();
}

class AppMaterialState extends State  <AppMaterial> with WidgetsBindingObserver{

  Locale? _locale;
    changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

@override
  void initState() {
WidgetsBinding.instance!.addObserver(this);
PreferencesGreen.setTema();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangePlatformBrightness() {
    PreferencesGreen.setTema();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return ValueListenableBuilder(
      valueListenable: PreferencesGreen.theme,

      builder: (BuildContext context, Brightness theme, _) =>
        MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Green',
        theme: ThemeData(
            primarySwatch: Colors.green,
            brightness:theme,
            fontFamily: 'khang'),
        locale: _locale,
        localeResolutionCallback: ((locale, supportedLocales) {
          if (locale?.languageCode == 'en') {
            return const Locale('en', 'US');
          }
          if (locale?.languageCode == 'es') {
            return const Locale('es', 'ES');
          }

          //default language
          return const Locale('pt', 'BR');
        }),
        localizationsDelegates: [
          // delegate from flutter_localization
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // delegate from localization package.
          LocalJsonLocalization.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en', 'US'),
          Locale('es', 'ES'),
          Locale('pt', 'BR'),
        ],
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
        },
      ),
    );
  }
}
