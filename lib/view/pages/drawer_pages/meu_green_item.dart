import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:localization/localization.dart';

import '../../../constants/json/create_budget_json.dart';
import '../../../constants/transaction/transaction.dart';
import '../../../constants/transaction_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/theme/colors.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  final TransActionController controller = TransActionController();

  final fomrKey = GlobalKey<FormState>();
  final RegExp verificNumber = RegExp(r'([0-9]{})'); // informações
  int activeCategory = 0;
  final TextEditingController _budgetName = TextEditingController(text: '');

  late DateTime date = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 31));
  //int _chartTabIndex = 0;
  final fromDate = DateTime(19, 11, 2022);
  final toDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Consumer<HomeController>(builder: (context, controller, __) {
          return Column(
            children: [
              //GraphWidget(),

              Form(
                key: fomrKey,
                child: getBody(),
              ),

              date_time(),
              confirmation(),
              mainBoard(controller.transactionList, locale),
            ],
          );
        }),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: const BoxDecoration(color: white, boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 10,
            blurRadius: 10,
            // changes position of shadow
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: const [],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
//=================================================

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(categories_.length, (index) {
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
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: grey.withOpacity(0.15)),
                              child: Center(
                                child: Image.asset(
                                  images[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          Text(
                            categories_[index].i18n(),
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
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "required_field".i18n();
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text('description'.i18n()),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) => controller.title = value,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (size.width - 58),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              validator: (String? valor) {
                                if (verificNumber.hasMatch(valor!) ||
                                    valor.isEmpty ||
                                    double.parse(valor.replaceAll(",", ".")) <=
                                        0) {
                                  return 'invalid_value'.i18n();
                                }

                                return null;
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: InputDecoration(
                                label: Text('value'.i18n()),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onChanged: (value) =>
                                  controller.value = double.parse(value),
                              cursorColor: black,
                              style:
                                  const TextStyle(fontSize: 17, color: black),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ]),
      )
    ]));
  }

  Expanded mainBoard(List<Transaction> _lista, Locale locale) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            //texto na main
            _lista.isEmpty
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
                                  color: Colors.green.withOpacity(0.1)),
                            ),
                            child: Image.asset(categories[index]['icon'],
                                fit: BoxFit.cover, width: 40, height: 40),
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
                                .format(_lista[index].date1),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Text(
                            _lista[index].value.toStringAsFixed(2),
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

  Widget date_time() {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            border: Border.all(width: 2, color: Colors.green)),
        width: 300,
        child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
            if (newDate == Null) return;
            setState(() {
              date = newDate!;
            });
          },
          child: Text(
            ' ${date.day} / ${date.month} / ${date.year}',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'sans-serif-light',
              color: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmation() {
    return SingleChildScrollView(
      child: Consumer<HomeController>(builder: (context, homeController, _) {
        return ElevatedButton(
          onPressed: () {
            setState(() {});
            var formValid = fomrKey.currentState?.validate() ?? false;
            var message = 'transactions_invalid'.i18n();

            if (formValid) {
              message = "transactions_valid".i18n();

              var trans = Transaction(
                  value: controller.value,
                  title: controller.title,
                  dateTime: DateTime.now(),
                  category: controller.category /////listar modificar
                  );

              homeController.setTransAction(trans);
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message)));
          },
          child: Icon(Icons.arrow_forward),
        );
      }),
    );
  }
}
