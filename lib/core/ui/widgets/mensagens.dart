import 'package:asuka/asuka.dart';

class Mensagens {
  Mensagens._();

  static void alert(String message) {
    AsukaSnackbar.alert(message).show();
  }

  static void info(String message) {
    AsukaSnackbar.info(message).show();
  }

  static void sucess(String message) {
    AsukaSnackbar.success(message).show();
  }
}
