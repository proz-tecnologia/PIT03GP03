import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../../../../constants/json/meugreen.dart';
import '../../../../constants/transaction/transactions_green.dart';
import '../../../../controller/home_controller.dart';

class MeuGreenTransactionsList extends StatefulWidget {
  const MeuGreenTransactionsList({Key? key}) : super(key: key);

  @override
  State<MeuGreenTransactionsList> createState() => _MeuGreenTransactionsListState();
}

class _MeuGreenTransactionsListState extends State<MeuGreenTransactionsList> {
  static const Color _primaryColor = Colors.green;
  static const Color _secondaryColor = Colors.white38;
  static const Color _thirdColor = Colors.deepOrangeAccent;
  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);
    return Scaffold(
 body: Consumer<HomeController>(builder: (context, controller, __) {
      return Column(
        children: [
          _appbarBotomSection(controller.total),
          mainBoard(controller.transactionList, locale),
        ],
      );
 }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
          )
        ]);
  }

  Widget _appbarBotomSection(double value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "money".i18n(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Text(value.toStringAsFixed(2).replaceAll(".", ","),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'bills_month'.i18n(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1),
          ),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Expanded mainBoard(List<Transaction> _lista, Locale locale) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[

           Column(
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

                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _lista.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: _primaryColor.withOpacity(0.1)),
                      ),
                      child: Image.asset(categories[index]['icon']!,
                          fit: BoxFit.cover, width: 45, height: 45),
                    ),
                    title: Text(_lista[index].title,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontFamily: 'sans-serif-light',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: Text(
                      DateFormat(DateFormat.YEAR_MONTH_DAY,
                          locale.toString())
                          .format(_lista[index].dateTime),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Text(
                      'R\$ ${_lista[index].value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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

  ///Report Cell
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
        color: isSavings ? Colors.white : _thirdColor,
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? []
            : [
          BoxShadow(
              color: _thirdColor.withOpacity(0.4),
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
                  value: progress / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? Colors.black.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
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

                 ] ),
    );
  }
}
