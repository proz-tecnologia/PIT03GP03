import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/view/pages/register/signup_pages/page_email.dart';
import 'package:localization/localization.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/widgets/loader.dart';
import '../../../../helpers/AppColors.dart';
import '../../login/login_page.dart';
import '../controller/register_controller.dart';

class PageName extends StatefulWidget {
  const PageName({Key? key}) : super(key: key);

  @override
  State<PageName> createState() => _PageNameState();
}

class _PageNameState extends State<PageName> {
  final controller = GetIt.instance.get<RegisterController>();
  final _fomrKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  @override
  void dispose() {

    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: Container(
        key: _fomrKey,
        color: Colors.white54,

        child: Column(
            children: [
              SizedBox(
                height: 10,
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
              Text('Para começar ,qual o seu NOME?', style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
              ),),


              SizedBox(height: 10,),
              Text('Precisamos dele para dar inicio ao seu cadastro.',
                style: TextStyle(
                    fontSize: 16, color: AppColors.grey
                ),), Align(
                alignment: Alignment.bottomLeft,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nameEC,
                cursorColor: AppColors.black,
                autofocus: true,
                autocorrect: true,
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                validator: Validatorless.multiple([
              Validatorless.required('Nome obrigatório'),
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
              Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 300, top: 50, bottom: 0),
                child: Column(

                  children: [
                    Container(

                      child: IconButton(
                          onPressed: () {

                            setState(() {
                              controller.name=_nameEC.text;
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
