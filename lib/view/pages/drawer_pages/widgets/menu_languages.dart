import 'package:flutter/material.dart';

import 'package:localization/localization.dart';

import '../../../../constants/app_text_styles.dart';

class MenuLanguages extends StatelessWidget {
  final Function(Locale locale) onTap;
  const MenuLanguages({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 220,
            decoration: BoxDecoration(
              color: locale == Locale('en', 'US') ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30.0),
                onTap: () {
                  Navigator.pop(context);
                  onTap(const Locale('en', 'US'));
                },
                child: Center(
                  child: Text(
                    'en_us'.i18n(),
                    style: locale == Locale('en', 'US')
                        ? AppStyles.white14900Khang18
                        : AppStyles.green14900Khang18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 60,
            width: 220,
            decoration: BoxDecoration(
              color: locale == Locale('pt', 'BR') ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30.0),
                onTap: () {
                  Navigator.pop(context);
                  onTap(const Locale('pt', 'BR'));
                },
                child: Center(
                  child: Text(
                    'pt_br'.i18n(),
                    style: locale == Locale('pt', 'BR')
                        ? AppStyles.white14900Khang18
                        : AppStyles.green14900Khang18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 60,
            width: 220,
            decoration: BoxDecoration(
              color: locale == Locale('es', 'ES') ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30.0),
                onTap: () {
                  Navigator.pop(context);
                  onTap(const Locale('es', 'ES'));
                },
                child: Center(
                  child: Text(
                    'es_es'.i18n(),
                    style: locale == Locale('es', 'ES')
                        ? AppStyles.white14900Khang18
                        : AppStyles.green14900Khang18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
