import 'package:flutter/material.dart';

class Pagamentos extends StatefulWidget {
  const Pagamentos({Key? key}) : super(key: key);

  @override
  State<Pagamentos> createState() => _PagamentosState();
}

class _PagamentosState extends State<Pagamentos> {
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
            Text('Carteira Digital',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                ))
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          '     Estamos Trabalhando por aqui  !! ',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
        const SizedBox(
          height: 222,
        ),
        Text(
          'No green você  as melhores  ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'moedas digitais da um GREEN! ',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
        SizedBox(
          height: 0,
        ),
        Image.asset('assets/trabalhando.png'),
      ],
    );
  }
}
