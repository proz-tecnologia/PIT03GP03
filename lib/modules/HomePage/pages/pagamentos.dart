import 'package:flutter/material.dart';
import 'package:green/models/transaction/transaction.dart';
import 'package:green/modules/HomePage/Controller/home_controller.dart';
import 'package:green/modules/HomePage/Controller/transaction_controller.dart';
import 'package:provider/provider.dart';

class TransActionPage extends StatefulWidget {
  const TransActionPage({super.key});

  @override
  State<TransActionPage> createState() => _TransActionPageState();
}

final TransActionController controller = TransActionController();

class _TransActionPageState extends State<TransActionPage> {
  final fomrKey = GlobalKey<FormState>();
  final RegExp verificNumber = RegExp(r'([0-9]{})');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
      ),
      body: Form(
        key: fomrKey,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text('Adicione um gasto'),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Campo obrigatório";
                }

                return null;
              },
              decoration: InputDecoration(
                  label: const Text('Descrição'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) => controller.title = value,
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownButton<String>(
                dropdownColor: Colors.green[100],
                value: controller.category,
                items: controller.categoryList
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Icon(controller.icon(e)),
                      ),
                    )
                    .toList(),
                onChanged: (a) {
                  controller.category = a ?? '';
                  //print(controller.category);
                  setState(() {});
                }),
            const SizedBox(
              height: 16,
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
              decoration: InputDecoration(
                  label: const Text('Valor'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) => controller.value = double.parse(value),
            ),
            const SizedBox(height: 16),
            Consumer<HomeController>(builder: (context, homeController, _) {
              return ElevatedButton(
                child: const Text('Adicionar'),
                onPressed: () {
                  var formValid = fomrKey.currentState?.validate() ?? false;
                  var message = 'Transação invalida';

                  if (formValid) {
                    message = "Transação adicionada com sucesso";

                    var trans = Transaction(
                      value: controller.value,
                      title: controller.title,
                      category: controller.category,
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
            })
          ],
        ),
      ),
    );
  }
}
