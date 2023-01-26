import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/controller/home_controller.dart';
import 'package:green/model/mocks/subCategory.dart';
import 'package:green/models/category.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localization/localization.dart';
import '../../../../constants/transaction_controller.dart';
import '../../../../helpers/Utils.dart';
import 'package:green/helpers/AppColors.dart';
import 'meu_green_subCategories.dart';

class MeuGreenDetailPage extends StatefulWidget {
  var categoryId;
  final String assetsName;
  final List<SubCategory> listSub;
  final String name;
  final bool isSelect;
  final SubCategory? i;
  final ValueNotifier<SubCategory?> _obseve;

  MeuGreenDetailPage(
      {required this.categoryId,
      required this.assetsName,
      required this.listSub,
      required this.name,
      required this.isSelect,
      this.i})
      : _obseve = ValueNotifier<SubCategory?>(i);

  @override
  State<MeuGreenDetailPage> createState() => _MeuGreenDetailPageState();
}

class _MeuGreenDetailPageState extends State<MeuGreenDetailPage> {
  //controllers
  final _controller = GetIt.instance.get<ControllerHome>();

  final RegExp verificNumber = RegExp(r'([0-9]{})');
  final TextEditingController _greenForm = TextEditingController(text: '');
  final TransActionController controller = TransActionController();
  final _txtDateTimeController = TextEditingController();
  final fomrKey = GlobalKey<FormState>();

//variaveis
  var transactionType = TransactionType.INCOME;
  late final transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];

//fuctions selects

  int activeCategory = 0;
  var _dateTime = DateTime.now();

//select favorited
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    //idiomas
    final locale = Localizations.localeOf(context);
    //mediaQuery

    Size size = MediaQuery.of(context).size;
    //lists

    List<Category> _categories = Utils.getMockedCategories();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Observer(builder: (context) {
        return Container(
          child: Form(
            //key
            key: fomrKey,
            child: getBody(
              _controller.transactionList,
              size,
              locale,
              _categories,
            ),
          ),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, Size size, Locale locale,
      List<Category> categories) {
    //SubCategory? aux;
    return Stack(children: [
      Column(children: [
        Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                color: categories[widget.categoryId].color,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/' + widget.assetsName + '.png',
                          fit: BoxFit.contain,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ]),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 350,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: ValueListenableBuilder<SubCategory?>(
                        valueListenable: widget._obseve,
                        builder: (_, indexValue, child) => ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.listSub.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget._obseve.value =
                                        widget.listSub[index];
                                    activeCategory = index;
                                  });
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          width: 3,
                                          color: activeCategory == index
                                              ? categories[widget.categoryId]
                                                  .color
                                              : Colors.transparent),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              AppColors.grey.withOpacity(0.01),
                                          spreadRadius: 10,
                                          blurRadius: 3,
                                          // changes position of shadow
                                        ),
                                      ]),
                                  child: Container(
                                    child: Image.asset(
                                        'assets/' +
                                            widget.listSub[index].assetsName +
                                            '.png',
                                        fit: BoxFit.contain,
                                        width: 60,
                                        height: 60),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                    Divider(),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Descriçao",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d)),
                            ),
                            TextFormField(
                              controller: _greenForm,
                              cursorColor: AppColors.primary,
                              autocorrect: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "required_field".i18n();
                                }

                                return null;
                              },
                              onChanged: (value) => controller.title = value,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                              decoration: InputDecoration(
                                  hintText: " Descrição ",
                                  border: InputBorder.none),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: (size.width),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Valor Gastos",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff67727d)),
                                      ),
                                      TextFormField(
                                        cursorColor: AppColors.primary,
                                        autofocus: true,
                                        autocorrect: true,
                                        validator: (String? valor) {
                                          if (verificNumber.hasMatch(valor!) ||
                                              valor.isEmpty ||
                                              double.parse(valor.replaceAll(
                                                      ",", ".")) <=
                                                  0) {
                                            return 'invalid_value'.i18n();
                                          }
                                          return null;
                                        },
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Valor  ",
                                          prefixIconColor: Colors.red,
                                        ),
                                        onChanged: (value) => controller.value =
                                            double.parse(value),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Confirmation(subC: widget._obseve.value),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() async {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              DateTime? date =
                                                  await showDatePicker(
                                                      context: context,
                                                      firstDate: DateTime.now()
                                                          .subtract(
                                                              const Duration(
                                                                  days: 360)),
                                                      lastDate: DateTime.now(),
                                                      initialDate: _dateTime);
                                              _dateTime = date ?? _dateTime;
                                              _txtDateTimeController.text =
                                                  "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                                            });
                                          },
                                          child: Icon(
                                            Ionicons.calendar,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                              fixedSize: MaterialStateProperty
                                                  .all<Size>(
                                                Size.fromRadius(30),
                                              ),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.green),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              )))),
                                    ])
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    ]);
  }

  Row Types() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: transactionTypes
          .map((e) => ChoiceChip(
              elevation: 2,
              selectedColor: e.color,
              labelStyle: const TextStyle(color: Colors.white),
              label: Text(e.label),
              selected: e.type == transactionType,
              onSelected: (value) => setState(() {
                    transactionType = e.type;
                  })))
          .toList(),
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

  SingleChildScrollView Confirmation({SubCategory? subC}) {
    final _controller = GetIt.instance.get<ControllerHome>();

    return SingleChildScrollView(
      child: Observer(builder: (context) {
        return Container(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    var formValid = fomrKey.currentState?.validate() ?? false;
                    print(formValid);
                    var message = 'transactions_invalid'.i18n();

                    if (formValid && subC != null) {
                      message = "transactions_valid".i18n();

                      var trans = Transaction(
                          subC: subC,
                          value: controller.value,
                          title: controller.title,
                          category: controller.category,
                          dateTime: _dateTime,
                          transactionType: TransactionType.INCOME,
                          description: '');

                      //TODO TÁ USANDO O MÉTODO ADD DO ANTIGO CONTROLLER
                      //_controller.add(trans);
                      _controller.setTransAction(trans);
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
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size.fromRadius(30),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )))),
            ],
          ),
        );
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

class DetailFeature extends StatelessWidget {
  final String detailFeature;
  final String title;

  const DetailFeature({
    Key? key,
    required this.detailFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          detailFeature,
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
