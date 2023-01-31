import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/view/pages/login/custom_text.dart';
import 'package:green/view/pages/register/signup_pages/page_value.dart';
import 'package:localization/localization.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/widgets/loader.dart';
import '../../../../helpers/AppColors.dart';
import '../controller/register_controller.dart';

class PagePassWord extends StatefulWidget {
  const PagePassWord({Key? key}) : super(key: key);

  @override
  State<PagePassWord> createState() => _PagePassWordState();
}

class _PagePassWordState extends State<PagePassWord> {
  final controller = GetIt.instance.get<RegisterController>();
  final _passwordEC = TextEditingController();
  final _fomrKey = GlobalKey<FormState>();
  final senha=TextEditingController();

  @override
  void dispose() {

    _passwordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: _fomrKey,
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

              Text('Lembre-se que a senha precisar  6 caracteres. ',style: TextStyle(
                  fontSize: 16,color: AppColors.grey
              ),),Align(
                alignment: Alignment.bottomLeft,
              ),
              SizedBox(
                height: 30,
              ),

              TextFormField(

                obscureText: true,
                controller: _passwordEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Senha obrigatória'),
                  Validatorless.min(
                      6, 'Senha deve conter ao menos 6 caracteres')
                ]),
                cursorColor: AppColors.black,
                autofocus: true,
                autocorrect: true,

                style: TextStyle(
                    fontSize: 17,

                    color:Colors.black),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black.withOpacity(.3),),
                    hintText: "",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:0 ,left:300 ,top:50 ,bottom:0 ),
                child: Column(

                  children: [
                    Container(

                      child: IconButton(
                          onPressed: () {
                            setState(() {

                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => PageValue()));
                            }
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 24,
                            color: Colors.black,
                          )),
                      padding: const EdgeInsets.all(3),
                      decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ]),

      ),

    );


  }
  _doRegister(BuildContext context, String name, String email, String password,
      double limite) async {
    Loader.show("Cadastrando...");
    await controller.doRegister(name, email, password, limite, context);
  }
  }
