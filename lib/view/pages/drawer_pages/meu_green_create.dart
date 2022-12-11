import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../constants/json/meugreen.dart';
import '../../../constants/transaction/transactions_green.dart';
import '../../../constants/transaction_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/theme/colors.dart';

class MeuGreenCreat extends StatefulWidget {
  @override
  _MeuGreenCreatState createState() => _MeuGreenCreatState();
}

class _MeuGreenCreatState extends State<MeuGreenCreat> {
  final fomrKey = GlobalKey<FormState>();
  var transactionType = TransactionType.INCOME;
  late final transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];
  final TransActionController controller = TransActionController();
  final _txtDateTimeController = TextEditingController();
  final TextEditingController _budgetName = TextEditingController(text: '');

  final RegExp verificNumber = RegExp(r'([0-9]{})'); // informações
  int activeCategory = 0;
  var _dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Consumer<HomeController>(builder: (context, controller, __) {
        return Container(
          child: Form(
            key: fomrKey,
            child: getBody(controller.transactionList, locale),
          ),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, Locale locale) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(color: Colors.white54, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
          child: Column(
            children: [],
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
//=================================================

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(categories.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                activeCategory = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                ),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(
                                        width: 2, //cards colors
                                        color: activeCategory == index
                                            ? primary
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.01),
                                        spreadRadius: 10,
                                        blurRadius: 3,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25, top: 20, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.15)),
                                  child: Center(
                                    child: Image.asset(
                                      categories[index]['icon']!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                                      Text(
                                        categories[index]['name']!,
                                style: const TextStyle(
                                  fontFamily: 'sans-serif-light',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Descrição",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextFormField(
                          controller: _budgetName,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        }

                        return null;
                      },
                      onChanged: (value) => controller.title = value,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Green +",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 140),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Valor",
                                style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Color(0xff67727d)),
                                  ),
                              TextFormField(
                                    validator: (String? valor) {
                                      if (verificNumber.hasMatch(valor!) ||
                                          valor.isEmpty ||
                                          double.parse(
                                              valor.replaceAll(",", ".")) <=
                                              0) {
                                        return 'valor inválido';
                                      }

                                      return null;
                                    },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                cursorColor: black,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                                decoration: InputDecoration(
                                  hintText: "R\$ 0,00",
                                  prefixIconColor: Colors.red,
                                ),
                                onChanged: (value) =>
                                    controller.value = double.parse(value),
                              ),
                              TextFormField(
                                controller: _txtDateTimeController,
                                keyboardType: TextInputType.datetime,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                                decoration: const InputDecoration(
                                  labelText: 'Data',
                                  hintText: '10/10/2010',
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Informe uma data.";
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now()
                                          .subtract(const Duration(days: 360)),
                                      lastDate: DateTime.now(),
                                      initialDate: _dateTime);
                                  _dateTime = date ?? _dateTime;
                                  _txtDateTimeController.text =
                                      "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Confirmation(),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: const Text(
            "TRANSAÇÕES",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontFamily: 'sans-serif-light',
            ),
          ),
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: transactionList.length,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: green.withOpacity(0.1)),
              ),
              child: Image.asset(categories[index]['icon']!,
                  fit: BoxFit.cover, width: 45, height: 45),
            ),
            title: Text(transactionList[index].title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: 'sans-serif-light',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: Text(
              DateFormat(DateFormat.YEAR_MONTH_DAY, locale.toString())
                  .format(transactionList[index].dateTime),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text(
              'R\$ ${transactionList[index].value.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Row TransactionTypes() {
    return Row(
      children: transactionTypes
          .map((e) => ChoiceChip(
              selectedColor: e.color,
              labelStyle: const TextStyle(color: Colors.green),
              label: Text(e.label),
              selected: e.type == transactionTypes,
              onSelected: (value) => setState(() {
                    transactionType = e.type;
                  })))
          .toList(),
    );
  }

  SingleChildScrollView Confirmation() {
    return SingleChildScrollView(
      child: Consumer<HomeController>(builder: (context, homeController, _) {
        return ElevatedButton(
            onPressed: () {
              setState(() {});
              var formValid = fomrKey.currentState?.validate() ?? false;
              var message = 'Transação invalida';

              if (formValid) {
                message = "Transação adicionada com sucesso";

                var trans = Transaction(
                    value: controller.value,
                    title: controller.title,
                    category: controller.category,
                    dateTime: _dateTime,
                    transactionType: TransactionType.INCOME);
                Provider.of<HomeController>(context, listen: false).add(trans);
                //  homeController.setTransAction(trans);
                Navigator.pop(context);
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(message),
              ));
            },
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))));
      }),
    );
  }
}

class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}
