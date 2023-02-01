import 'package:asuka/asuka.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter/material.dart';

class Loader {
  static OverlayEntry? _entry;
  static bool _open = false;

  Loader._();

  static void show(String message) {
    _entry ??= OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black54,
        child: Container(
          color: Colors.black54,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        EasyLoader(
        image: AssetImage(
        'assets/moneybox.gif',
        ),
        iconColor: Colors.grey,
        ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });

    if (!_open) {
      _open = true;
      Asuka.addOverlay(_entry!);
    }
  }

  static void hide() {
    if (_open) {
      _open = false;
      _entry?.remove();
    }
  }
}
