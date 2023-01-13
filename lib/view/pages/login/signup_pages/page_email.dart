import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../helpers/AppColors.dart';

class PageEmail extends StatefulWidget {
  const PageEmail({Key? key}) : super(key: key);

  @override
  State<PageEmail> createState() => _PageEmailState();
}

class _PageEmailState extends State<PageEmail> {
  final fomrKey = GlobalKey<FormState>();
  final email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      key: fomrKey,
      color: Colors.white70,

      child: Column(
          children: [
            SizedBox(
              height: 82,
            ),

            // Text(
            //   "Boas-Vindas ao GREEN !",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 30,
            //       color: AppColors.black),
            //
            // ),
            SizedBox(
              height: 5,
            ),
            Text('Em qual e-mail podemos fazer o seu cadastro?',style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold
            ),),


            SizedBox(height: 10,),
            Text('Ele será usado para realizar login e novidades sobre o seu GREEN..',style: TextStyle(
                fontSize: 16,color: AppColors.grey
            ),),Align(
              alignment: Alignment.bottomLeft,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              cursorColor: AppColors.black,

              autocorrect: true,
              autovalidateMode:
              AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "required_field".i18n();
                }

                return null;
              },
              style: TextStyle(
                  fontSize: 17,

                  color:Colors.black),
              decoration: InputDecoration(

                  hintText: " ",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
          ]),

    );


  }
}
