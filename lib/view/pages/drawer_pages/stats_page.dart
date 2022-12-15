import 'package:flutter/material.dart';
import 'package:green/constants/app_text_styles.dart';
import 'package:localization/localization.dart';

class MeuGreenCart extends StatefulWidget {
  const MeuGreenCart({Key? key}) : super(key: key);

  @override
  State<MeuGreenCart> createState() => _MeuGreenCartState();
}

class _MeuGreenCartState extends State<MeuGreenCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.green),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5000),
            bottomRight: Radius.circular(5000),
          ),
        ),
        child: Column(
          children: [
            TextBar(),
          ],
        ),
      ),
    );
  }
}

class TextBar extends StatelessWidget {
  const TextBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'goals'.i18n(),
              style: AppStyles.write36600Normal,
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const SizedBox(
          height: 180,
        ),
        Text(
          'work'.i18n(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'commit'.i18n(),
          style: TextStyle(color: Colors.white, fontSize: 21),
        ),
        SizedBox(
          height: 0,
        ),
        Image.asset('assets/trabalhando.png'),
      ],
    );
  }
}
