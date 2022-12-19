import 'package:flutter/material.dart';

import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/theme/colors.dart';

class MeuGreenCarteira extends StatefulWidget {
  const MeuGreenCarteira({Key? key}) : super(key: key);

  @override
  State<MeuGreenCarteira> createState() => _MeuGreenCarteiraState();
}

class _MeuGreenCarteiraState extends State<MeuGreenCarteira> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.green),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5000),
          ),
        ),
        child: Column(
          children: [

            TextBar(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class cards extends StatelessWidget {
  const cards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white70,
          boxShadow: [

            BoxShadow(
                color: Colors.green,
                blurRadius: 10,
                spreadRadius: 10,
                offset: Offset(0.0, 8.0))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              height: 130,
            ),
            SizedBox(
              height: 25,
            ),
            //Texts(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            )
          ],
        ),
      ),
    );
  }
}

class TextBar extends StatefulWidget {
  TextBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  double aux = 0.0;

  final RegExp verificNumber = RegExp(r'([0-9]{})');

  final fomrKeyLimite = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fomrKeyLimite,
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Text(
                  'money'.i18n(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
              // entrar com a logica no lugar do texto
              Text(
                  '${Provider.of<HomeController>(context, listen: false).limite.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  )),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'financial_limit'.i18n(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3,
                    // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 25, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "set_limit".i18n(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'money'.i18n(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (String? valor) {
                          if (verificNumber.hasMatch(valor!) ||
                              valor.isEmpty ||
                              double.parse(valor.replaceAll(",", ".")) <= 0) {
                            return 'invalid_value'.i18n();
                          }

                          return null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        cursorColor: white,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: white),
                        decoration: InputDecoration(
                          hintText:
                              "${Provider.of<HomeController>(context, listen: false).limite.toStringAsFixed(2)}",
                          prefixIconColor: white,
                        ),
                        onChanged: (value) => aux = double.parse(value),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      var formValid =
                          fomrKeyLimite.currentState?.validate() ?? false;
                      var message = 'invalid_value'.i18n();

                      if (formValid) {
                        message = "limit_updte".i18n();

                        Provider.of<HomeController>(context, listen: false)
                            .mudarLimite(aux);

                        Navigator.pop(context);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(message),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "update".i18n(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
class Texts extends StatelessWidget {
  const Texts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.arrow_downward,
              size: 19,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            'Balanço Total',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'sans-serif-light'),
          ),
          SizedBox(
            width: 50,
          ),
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.arrow_upward_outlined,
              size: 19,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            'Balanço Total',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'sans-serif-light'),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

*/