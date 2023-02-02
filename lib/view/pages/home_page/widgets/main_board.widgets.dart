// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/helpers/AppColors.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

class MainBoardWidgets extends StatefulWidget {
  List<Transaction> lista;
  Locale? locale;
  Function remove;
  bool ishome;

  MainBoardWidgets({
    Key? key,
    required this.lista,
    required this.ishome,
    required this.locale,
    required this.remove,
  }) : super(key: key);

  @override
  State<MainBoardWidgets> createState() => _MainBoardWidgetsState();
}

class _MainBoardWidgetsState extends State<MainBoardWidgets> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            widget.ishome == true
                ? Column(
                    children: [
                      _reportCell(
                          isSavings: true,
                          title: 'fuel.'.i18n(),
                          gastos: '150,00',
                          progress: 25),
                      //icone vermelho
                      const SizedBox(height: 16),
                      _reportCell(
                          isSavings: false,
                          title: 'ceiling'.i18n(),
                          gastos: '',
                          progress: 50),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 1,
                  ),
            //texto na main
            widget.lista.isEmpty
                ? Column(
                    children: [
                      Text(
                        'no_expenses'.i18n(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Arial',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          'assets/pigSleeping.png',
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'transactions'.i18n(),
                              style: TextStyle(
                                fontFamily: 'sans-serif-light',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'value'.i18n(),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'sans-serif-light',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),

                      // listview widgets (trocar para logica transações

                      Observer(
                        builder: (_) => ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: widget.lista.length,
                          itemBuilder: (context, index) => Observer(
                            builder: (_) => DismissibleWidget<Transaction>(
                              onDismissed: ((p0) => _dialogBuilder(
                                  context, widget.remove, index)),
                              item: widget.lista[index],
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color:
                                            AppColors.primary.withOpacity(0.1)),
                                  ),
                                  child: Image.asset(
                                      'assets/' +
                                          widget.lista[index].image +
                                          '.png',
                                      fit: BoxFit.contain,
                                      width: 45,
                                      height: 45),
                                ),
                                title: Text(widget.lista[index].title,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'sans-serif-light',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )),
                                subtitle: Text(
                                  DateFormat(DateFormat.YEAR_MONTH_DAY,
                                          widget.locale.toString())
                                      .format(widget.lista[index].data!),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                trailing: Text(
                                  'R\$ ${widget.lista[index].value.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

Container _reportCell({
  required bool isSavings,
  required String title,
  required String gastos,
  required int progress,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: isSavings ? Colors.white : AppColors.third,
      border: isSavings
          ? Border.all(color: AppColors.primary.withOpacity(0.1), width: 2)
          : null,
      boxShadow: isSavings
          ? []
          : [
              BoxShadow(
                  color: AppColors.third.withOpacity(0.4),
                  offset: const Offset(1, 0),
                  blurRadius: 10),
            ],
    ),

//graficos adicionar logica

    child: Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                value: 10.0 / 100,
                strokeWidth: 6,
                backgroundColor: isSavings
                    ? Colors.black.withOpacity(0.2)
                    : Colors.black.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(
                    isSavings ? AppColors.secondary : Colors.white),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              child: Text(
                '$progress%',
                style: TextStyle(
                  color: isSavings ? Colors.black : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),

        //graficos 2
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: isSavings ? Colors.black : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                _reportInner(
                    isSavings: isSavings, title: 'expenses'.i18n(), value: ''),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Column _reportInner(
    {required bool isSavings, required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: TextStyle(
          color: isSavings ? Colors.black87 : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

class DismissibleWidget<T> extends StatelessWidget {
  final Widget child;
  final T item;
  Future<bool?> Function(DismissDirection) onDismissed;

  DismissibleWidget({
    Key? key,
    required this.child,
    required this.item,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        direction: DismissDirection.endToStart,
        key: ObjectKey(item),
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(
            Icons.delete_forever_outlined,
            color: Colors.white,
          ),
          color: Colors.red,
        ),
        child: child,
        confirmDismiss: onDismissed,
      );
}

Future<bool?> _dialogBuilder(BuildContext context, Function remove, int index) {
  return showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Remover'),
        content: const Text('Tem certeza que deseja remover essa transação?'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Sim'),
            onPressed: () {
              remove(index);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Não'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
