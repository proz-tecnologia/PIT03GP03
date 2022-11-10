import 'package:flutter/material.dart';

class TransactionWidgetsPage extends StatefulWidget {
  const TransactionWidgetsPage({Key? key}) : super(key: key);

  @override
  State<TransactionWidgetsPage> createState() => _TransactionWidgetsPageState();
}

class _TransactionWidgetsPageState extends State<TransactionWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white70,
    ));
  }
}
