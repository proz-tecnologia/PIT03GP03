import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/json/meugreen.dart';
import '../../../constants/transaction/transaction.dart';
import '../../../constants/transaction_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/theme/colors.dart';

class MeuGreenCreat extends StatefulWidget {
  @override
  _MeuGreenCreatState createState() => _MeuGreenCreatState();
}

class _MeuGreenCreatState extends State<MeuGreenCreat> {
  final TransActionController controller = TransActionController();

  final fomrKey = GlobalKey<FormState>();
  final RegExp verificNumber = RegExp(r'([0-9]{})'); // informações
  int activeCategory = 0;
  final TextEditingController _budgetName = TextEditingController(text: '');

  late DateTime date = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 31));
  int _chartTabIndex = 0;
  final fromDate = DateTime(19, 11, 2022);
  final toDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: Consumer<HomeController>(builder: (context, controller, __) {
        return Column(
          children: [
            //GraphWidget(),

            Form(
              key: fomrKey,
              child: getBody(),
            ),

            //mainBoard(controller.transactionList),
          ],
        );
      }),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white54, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, right: 0, left: 0, bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          disabledBackgroundColor:
                              Colors.grey.withOpacity(0.12),
                        )),
                    Text(
                      "+ GREEN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Row(
                      children: [Icon(Icons.search_outlined)],
                    )
                  ],
                ),
              ],
            ),
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
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.15)),
                                  child: Center(
                                    child: Image.asset(
                                      categories[index]['icon'],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              Text(
                                categories[index]['name'],
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        }

                        return null;
                      },
                      onChanged: (value) => controller.title = value,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      decoration: InputDecoration(
                          hintText: "Green +", border: InputBorder.none),
                    ),
                    SizedBox(
                      height: 20,
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
                                    border: InputBorder.none),
                                onChanged: (value) =>
                                    controller.value = double.parse(value),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 50,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Confirmation(),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
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
                    createdDate: DateTime.now(),
                    category: controller.category,
                    dateTime: date1 /////listar modificar
                    );

                homeController.setTransAction(trans);
                Navigator.pop(context);
              }
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
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
