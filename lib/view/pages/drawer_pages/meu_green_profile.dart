import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/stores/user.store.dart';
import 'package:localization/localization.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:green/helpers/AppColors.dart';
import '../../../controller/home_controller.dart';

class MeuGreenProfile extends StatefulWidget {
  @override
  _MeuGreenProfileState createState() => _MeuGreenProfileState();
}

class _MeuGreenProfileState extends State<MeuGreenProfile> {
  double aux = 0.0;
  final RegExp verificNumber = RegExp(r'([0-9]{})');
  final fomrKeyLimite = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController(text: "Green@green.com");
  TextEditingController dateOfBirth = TextEditingController(text: "01-12-1980");
  TextEditingController password = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: Observer(builder: (context) {
        return Container(
          child: Form(
            key: fomrKeyLimite,
            child: getBody(),
          ),
          //getBody(),
        );
      }),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.white54,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
          size: 22,
        ),
      ),
    );
  }

  Widget getBody() {
    final userStore = GetIt.instance.get<UserStore>();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 0.4,
                        child: Container(
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: -2,
                                child: CircularPercentIndicator(
                                    circularStrokeCap: CircularStrokeCap.round,
                                    backgroundColor:
                                        AppColors.grey.withOpacity(0.3),
                                    radius: 110.0,
                                    lineWidth: 6.0,
                                    percent: 0.53,
                                    progressColor: AppColors.primary),
                              ),
                              Positioned(
                                top: 16,
                                left: 13,
                                child: Container(
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/avatar.png',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: (size.width - 40) * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Green",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              color: AppColors.black),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Definir novo  Limite financeiro",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: AppColors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'money'.i18n(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: AppColors.white),
                              ),
                              SizedBox(
                                height: 10,
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
                                cursorColor: AppColors.white,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                                decoration: InputDecoration(
                                  hintText:
                                      "${userStore.profile!.limite.toStringAsFixed(2)}",
                                  prefixIconColor: Colors.white,
                                ),
                                onChanged: (value) => aux = double.parse(value),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var formValid =
                                  fomrKeyLimite.currentState?.validate() ??
                                      false;
                              var message = 'Valor invalida';

                              if (formValid) {
                                message = "Limite atualizado com sucesso";
                                Loader.show("Atualizando...");
                                /*Provider.of<HomeController>(context,
                                        listen: false)
                                    .mudarLimite(aux);*/

                                await FirebaseFirestore.instance
                                    .collection("profiles")
                                    .doc(userStore.uid)
                                    .update({'limite': aux});
                                //TODO aquiiiiii

                                userStore.profile!.copyWith(limite: aux);

                                Loader.hide();
                                Mensagens.sucess(message);
                                Navigator.pop(context);
                              }

                              if (!formValid) {
                                Mensagens.alert(message);
                              }
                              /*ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(message),
                              ));*/
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.white)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Atualizar",
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  controller: _email,
                  cursorColor: AppColors.black,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                  decoration: InputDecoration(
                      hintText: "Email", border: InputBorder.none),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Aniversário",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  controller: dateOfBirth,
                  cursorColor: AppColors.black,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                  decoration:
                      InputDecoration(hintText: "", border: InputBorder.none),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Senha",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                TextField(
                  obscureText: true,
                  controller: password,
                  cursorColor: AppColors.black,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                  decoration: InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
