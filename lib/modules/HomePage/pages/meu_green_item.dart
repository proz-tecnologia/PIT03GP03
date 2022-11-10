import 'package:flutter/material.dart';
import 'package:green/modules/HomePage/Controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../json/create_budget_json.dart';
import '../../../models/transaction/transaction.dart';
import '../../../theme/colors.dart';
import '../Controller/transaction_controller.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  final TransActionController controller = TransActionController();

  final fomrKey = GlobalKey<FormState>();
  final RegExp verificNumber = RegExp(r'([0-9]{})'); // informações
  int activeCategory = 0;
  TextEditingController _budgetName = TextEditingController(text: '');
  TextEditingController _budgetPrice = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
      ),
      backgroundColor: grey.withOpacity(0.05),
      body: Form(key: fomrKey, child: getBody()),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: []),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Text(
              "Categorias",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5)),
            ),
          ),
          SizedBox(
            height: 20,
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
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    width: 150,
                    height: 170,
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
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: grey.withOpacity(0.15)),
                              child: Center(
                                child: Image.asset(
                                  categories[index]['icon'],
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          Text(
                            categories[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                  controller: _budgetName,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration:
                      InputDecoration(hintText: " ", border: InputBorder.none),
                  onChanged: (value) => controller.title = value,
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
                              "",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d)),
                            ),
                            TextFormField(
                              validator: (String? valor) {
                                if (verificNumber.hasMatch(valor!) ||
                                    valor.isEmpty ||
                                    double.parse(valor.replaceAll(",", ".")) <=
                                        0) {
                                  return 'valor inválido';
                                }

                                return null;
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: InputDecoration(
                                  label: const Text('Valor'),
                                  border: InputBorder.none),
                              onChanged: (value) =>
                                  controller.value = double.parse(value),
                              controller: _budgetPrice,
                              cursorColor: black,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Consumer<HomeController>(
                          builder: (context, homeController, _) {
                        return ElevatedButton(
                          child: Icon(Icons.arrow_forward),
                          onPressed: () {
                            var formValid =
                                fomrKey.currentState?.validate() ?? false;
                            var message = 'Transação invalida';

                            if (formValid) {
                              message = "Transação adicionada com sucesso";

                              var trans = Transaction(
                                  value: controller.value,
                                  title: controller.title,
                                  category:
                                      controller.category /////listar modificar
                                  );

                              homeController.setTransAction(trans);
                              Navigator.pop(context);
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(message)));
                            // print(
                            //     '${controller.title} + ${controller.category} + ${controller.value}');
                            // setState(() {});
                          },
                        );
                      }),
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
