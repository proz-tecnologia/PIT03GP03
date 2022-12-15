import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/controller/home_controller.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../../../../constants/transaction_controller.dart';
import '../../../../model/meu_green_category.dart';
import '../../../../utils/theme/colors.dart';

class MeuGreenDetailPage extends StatefulWidget {
  final int categoryId;

  const MeuGreenDetailPage({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<MeuGreenDetailPage> createState() => _MeuGreenDetailPageState();
}

class _MeuGreenDetailPageState extends State<MeuGreenDetailPage> {
  final TransActionController controller = TransActionController();
  final fomrKey = GlobalKey<FormState>();
  var transactionType = TransactionType.INCOME;
  late final transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];
  final _txtDateTimeController = TextEditingController();
  final TextEditingController _greenForm = TextEditingController(text: '');
  final RegExp verificNumber = RegExp(r'([0-9]{})');
  int activeCategory = 0;
  var _dateTime = DateTime.now();

  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    Size size = MediaQuery.of(context).size;
    List<GreenList> _greenList = GreenList.categoryList;
    return Scaffold(
      body: Consumer<HomeController>(builder: (context, controller, _) {
        return Container(
          child: Form(
            key: fomrKey,
            child:
                getBody(controller.transactionList, _greenList, size, locale),
          ),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, List<GreenList> _greenList,
      Size size, Locale locale) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green.withOpacity(.15),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.green,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('favorite');
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green.withOpacity(.15),
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          bool isFavorited = toggleIsFavorated(
                              _greenList[widget.categoryId].isFavorated);
                          _greenList[widget.categoryId].isFavorated =
                              isFavorited;
                        });
                      },
                      icon: Icon(
                        _greenList[widget.categoryId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.deepOrange,
                      )),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: Container(
            width: size.width * .8,
            height: size.height * .8,
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 0,
                  child: SizedBox(
                    height: 350,
                    child: Image.asset(_greenList[widget.categoryId].image),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //  ==========================
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            height: size.height * .5,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                _greenList[widget.categoryId].tittle,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 50,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Descrição",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextFormField(
                  controller: _greenForm,
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
              ]),
              const SizedBox(
                height: 10,
              ),
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
                      double.parse(valor.replaceAll(",", ".")) <= 0) {
                    return 'valor inválido';
                  }

                  return null;
                },
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                cursorColor: black,
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: black),
                decoration: InputDecoration(
                  hintText: "R\$ 0,00",
                  prefixIconColor: Colors.red,
                ),
                onChanged: (value) => controller.value = double.parse(value),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 360)),
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
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromRadius(30),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )))),
                  Confirmation()
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }

  // Row TransactionTypes() {
  //   return Row(
  //     children: transactionTypes
  //         .map((e) => ChoiceChip(
  //         selectedColor: e.color,
  //         labelStyle: const TextStyle(color: Colors.green),
  //         label: Text(e.label),
  //         selected: e.type == transactionTypes,
  //         onSelected: (value) => setState(() {
  //           transactionType = e.type;
  //         })))
  //         .toList(),
  //   );
  // }

  SingleChildScrollView Confirmation() {
    return SingleChildScrollView(
      child: Consumer<HomeController>(builder: (context, homeController, _) {
        return Container(
          child: Row(
            children: [
              ElevatedButton(
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
                      Provider.of<HomeController>(context, listen: false)
                          .add(trans);
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
