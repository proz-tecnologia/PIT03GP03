import 'package:flutter/material.dart';

class MeuGreenMetas extends StatefulWidget {
  const MeuGreenMetas({Key? key}) : super(key: key);

  @override
  State<MeuGreenMetas> createState() => _MeuGreenMetasState();
}

class _MeuGreenMetasState extends State<MeuGreenMetas> {
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
            Text('Metas',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
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
