import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

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
            Texts(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            )
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
            Text('0,00',
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
          '       Limite Financeiro  ',
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
        )
      ],
    );
  }
}
