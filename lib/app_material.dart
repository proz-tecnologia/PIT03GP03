import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:green/view/pages/drawer_pages/chart_page.dart';
import 'package:green/view/pages/drawer_pages/meuGreen.dart';
import 'package:green/view/pages/drawer_pages/meu_green_profile.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_historico.dart';
import 'package:green/view/pages/home_page/homepage.dart';
import 'package:green/view/pages/login/login_page.dart';
import 'package:green/view/pages/register/widgets/signup_page_login.dart';
import 'package:green/view/todo_green.dart';
import 'package:localization/localization.dart';
import 'utils/preferences_green.dart';
import 'view/pages/drawer_pages/meu_green_metas.dart';
import 'view/pages/onboarding_screen/Meu_green_onboarding.dart';
import 'view/pages/splash_screen/splash_Screen.dart';

class AppMaterial extends StatefulWidget {
  const AppMaterial({super.key});

  @override
  State<AppMaterial> createState() => AppMaterialState();
}

class AppMaterialState extends State<AppMaterial> with WidgetsBindingObserver {
  Locale? _locale;

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    PreferencesGreen.setTema();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
      builder: (BuildContext context, Brightness theme, _) => MaterialApp(
        builder: Asuka.builder,
        navigatorObservers: [
          Asuka.asukaHeroController,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Green',
        theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: theme,
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
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
          '/sinup': (context) => SignUp(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/home': (context) => const HomePage2(),
          '/metas': (context) => const MeuGreenMetas(),
          '/extrato': (context) => MeuHistorico(),
          '/meuGreen': (context) => RootApp(),
          '/config': (context) => MeuGreenProfile(),
          '/chart': (context) => ChartPage(),
          '/todo': (context) => TodoGreen(),
        },
      ),
    );
  }
}
