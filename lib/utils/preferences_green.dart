import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PreferencesGreen {
  static ValueNotifier<Brightness> theme = ValueNotifier(Brightness.light);
  static setTema() {
    theme.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    changeStatusNavigationBar();
  }

  static changeStatusNavigationBar() {
    bool isDark = theme.value == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
        statusBarColor:
            isDark ? const Color(0xff424242) : const Color(0xFF4CAF50),
        //systemNavigationBarColor:  isDark ?const Color(0xff303030) : const  Color(0xfffafa),
        // systemNavigationBarContrastEnforced:  true,
        //systemNavigationBarDividerColor:  Color(0xfffafa),
        systemStatusBarContrastEnforced: true));
  }
}
