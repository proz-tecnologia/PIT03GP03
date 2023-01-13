import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../helpers/AppColors.dart';

class PagePassWord extends StatefulWidget {
  const PagePassWord({Key? key}) : super(key: key);

  @override
  State<PagePassWord> createState() => _PagePassWordState();
}

class _PagePassWordState extends State<PagePassWord> {
  final fomrKey = GlobalKey<FormState>();
  final senha=TextEditingController();
  bool isLogin=true;
  @override
  Widget build(BuildContext context) {

    return  Container(
      key: fomrKey,
      color: Colors.white54,

      child: Column(



          children: [
            SizedBox(
              height: 90,
            ),

            // Text(
            //   "Boas-Vindas ao GREEN !",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 30,
            //       color: AppColors.black),
            //
            // ),

            Text('Agora digite uma senha.',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold
            ),),


            SizedBox(height: 30,),
            Text('Lembre-se que a senha precisar  6 caracteres ',style: TextStyle(
                fontSize: 16,color: AppColors.grey
            ),),Align(
              alignment: Alignment.bottomLeft,
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: senha,
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

                  hintText: "**********",
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
            ),
          ]),

    );


  }
}
