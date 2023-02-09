import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/core/ui/widgets/mensagens.dart';
import 'package:green/stores/user.store.dart';
import 'package:localization/localization.dart';
import 'package:green/helpers/AppColors.dart';

class MeuGreenCarteira extends StatefulWidget {
  const MeuGreenCarteira({Key? key}) : super(key: key);

  @override
  State<MeuGreenCarteira> createState() => _MeuGreenCarteiraState();
}

class _MeuGreenCarteiraState extends State<MeuGreenCarteira> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent,foregroundColor: Colors.black,
        title: Text('Limite Financeiro',style: TextStyle(
            fontSize: 13,fontFamily: 'sans-serif-light'
        ),),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 50,),
          TextBar(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class cards extends StatelessWidget {
  const cards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              height: 130,
            ),
            SizedBox(
              height: 25,
            ),
            //Texts(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            )
          ],
        ),
      ),
    );
  }
}

class TextBar extends StatefulWidget {
  TextBar({
    Key? key,
  }) : super(key: key);

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
  double aux = 0.0;

  final userStore = GetIt.instance.get<UserStore>();

  final RegExp verificNumber = RegExp(r'([0-9]{})');

  final fomrKeyLimite = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fomrKeyLimite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Text(
                  'money'.i18n(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
              // entrar com a logica no lugar do texto
              Text('${userStore.profile!.limite.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontFamily: 'Savoye Let',
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  )),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Limite financeiro Atual'.i18n(),
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
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
                        "set_limit".i18n(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColors.black),
                      ),

                      Text(
                        'money'.i18n(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: AppColors.white),
                      ),

                      TextFormField(
                        validator: (String? valor) {
                          if (verificNumber.hasMatch(valor!) ||
                              valor.isEmpty ||
                              double.parse(valor.replaceAll(",", ".")) <= 0) {
                            return 'invalid_value'.i18n();
                          }

                          return null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        cursorColor: AppColors.black,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                        decoration: InputDecoration(
                          hintText:
                          "R\$ ${userStore.profile!.limite.toStringAsFixed(2)}",
                          prefixIconColor: AppColors.black,
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
                          fomrKeyLimite.currentState?.validate() ?? false;
                      var message = 'invalid_value'.i18n();

                      if (formValid) {
                        message = "limit_updte".i18n();

                        Loader.show("Atualizando...");

                        //Atualizando no Firebase
                        await FirebaseFirestore.instance
                            .collection("profiles")
                            .doc(userStore.uid)
                            .update({'limite': aux});

                        //Atualizando local
                        userStore.profile!.copyWith(limite: aux);




                        Loader.hide();
                        Mensagens.sucess(message);
                        Navigator.pop(context);
                      }

                      if (!formValid) {
                        Mensagens.alert(message);
                      }
                    },

                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),

                        child: Text(
                          "update".i18n(),
                          style: TextStyle(color: Colors.green),
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
    );
  }
}

/*
class Texts extends StatelessWidget {
  const Texts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.arrow_downward,
              size: 19,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            'Balanço Total',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'sans-serif-light'),
          ),
          SizedBox(
            width: 50,
          ),
          CircleAvatar(
            radius: 13,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.arrow_upward_outlined,
              size: 19,
            ),
          ),
          SizedBox(
            width: 05,
          ),
          Text(
            'Balanço Total',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'sans-serif-light'),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

*/