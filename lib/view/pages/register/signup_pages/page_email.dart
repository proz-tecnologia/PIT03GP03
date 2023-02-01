import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/view/pages/register/signup_pages/page_password.dart';
import 'package:localization/localization.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/widgets/loader.dart';
import '../../../../helpers/AppColors.dart';
import '../controller/register_controller.dart';

class PageEmail extends StatefulWidget {
  const PageEmail({Key? key}) : super(key: key);

  @override
  State<PageEmail> createState() => _PageEmailState();
}

class _PageEmailState extends State<PageEmail> {
  final controller = GetIt.instance.get<RegisterController>();
  //final _controller = GetIt.instance.get<ControllerRegister>();

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: _formKey,
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
              Container(

                  child: TextFormField(
                    controller: _emailEC,
                    cursorColor: AppColors.black,
                    autofocus: true,
                    autocorrect: true,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator:  Validatorless.multiple([
                      Validatorless.required('Email obrigatório'),
                      Validatorless.email('Email não válido'),
                    ]),

                    style: TextStyle(
                        fontSize: 17,

                        color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email,
                          color: Colors.black.withOpacity(.3),),

                        hintStyle: TextStyle(

                            color: Colors.grey
                        )
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 300, top: 50, bottom: 0),
                child: Column(

                  children: [
                    Container(

                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (_) => PageEmail()));
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
                      BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white54),
                    ),
                  ],
                ),
              ),

            ]),

      ),
    );
  }

  }

