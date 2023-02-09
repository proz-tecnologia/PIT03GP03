import 'package:flutter/material.dart';
import 'package:green/constants/transaction/transactions_green.dart';

class ItemTransaction extends StatefulWidget {
  Transaction transaction;

  ItemTransaction(this.transaction, {super.key});

  @override
  State<ItemTransaction> createState() => _ItemTransactionState();
}

class _ItemTransactionState extends State<ItemTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
