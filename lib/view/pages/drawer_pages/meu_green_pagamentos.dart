import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        title: Text('Pagamentos'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5000),
            bottomRight: Radius.circular(5000),
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
