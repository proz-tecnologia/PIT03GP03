import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../helpers/AppColors.dart';

class PageName extends StatefulWidget {
  const PageName({Key? key}) : super(key: key);

  @override
  State<PageName> createState() => _PageNameState();
}

class _PageNameState extends State<PageName> {
  final fomrKey = GlobalKey<FormState>();
  final name=TextEditingController();
  bool isLogin=true;
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: fomrKey,
        color: Colors.white54,

        child: Column(



          children: [
            SizedBox(
              height: 100,
            ),

          Text(
          "Boas-Vindas ao GREEN !",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColors.black),

        ),
            SizedBox(
              height: 5,
            ),
        Text('Para começar ,qual o seu NOME?.',style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold
        ),),


        SizedBox(height: 10,),
            Text('Precisamos dele para dar inicio ao seu cadastro.',style: TextStyle(
                fontSize: 16,color: AppColors.grey
            ),),Align(
              alignment: Alignment.bottomLeft,
            ),
SizedBox(
  height: 20,
),
        TextFormField(
         controller: name,
          cursorColor: AppColors.black,
autofocus: true,
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
              prefixIcon: Icon(Icons.alternate_email, color: Colors.black.withOpacity(.3),),

            hintStyle: TextStyle(

              color: Colors.grey
            )
          ),
        ),
      ]),

      ),
    );


  }
}
