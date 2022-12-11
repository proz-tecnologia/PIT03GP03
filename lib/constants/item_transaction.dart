import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/controller/extrato.dart';

class ItemTransaction extends StatefulWidget {
  Transaction transaction;

  ItemTransaction(this.transaction, {super.key});

  @override
  State<ItemTransaction> createState() => _ItemTransactionState();
}

class _ItemTransactionState extends State<ItemTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Text(
          "${widget.transaction.dateTime?.day}/${widget.transaction.dateTime?.month}",
          style: TextStyle(color: getColor()),
        ),
        title:
            Text(widget.transaction.title, style: TextStyle(color: getColor())),
        trailing: Text(getValue(), style: TextStyle(color: getColor())),
      ),
    );
  }

  Color getColor() {
    switch (widget.transaction.transactionType) {
      case TransactionType.INCOME:
        return Colors.green;
      case TransactionType.EXPENSE:
        return Colors.red;
    }
  }

  String getValue() {
    switch (widget.transaction.transactionType) {
      case TransactionType.INCOME:
        return widget.transaction.value.formatBRL;
      case TransactionType.EXPENSE:
        return "(${widget.transaction.value.formatBRL})";
    }
  }
}
