import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/widgets/loader.dart';
import '../../../../helpers/AppColors.dart';
import '../controller/register_controller.dart';

class PageValue extends StatefulWidget {
  const PageValue({Key? key}) : super(key: key);

  @override
  State<PageValue> createState() => _PageValueState();
}

class _PageValueState extends State<PageValue> {
  final controller = GetIt.instance.get<RegisterController>();

  //final _controller = GetIt.instance.get<ControllerRegister>();

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _valueEc = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _nameEC.dispose();
    _valueEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

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
                Text('Agora vamos definir um valor de gastos Mensais.',
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold
                  ),),


                SizedBox(height: 10,),
                Text(
                  'Lembre-se que você pode altera o limite ,quando você se sentir confortável!',
                  style: TextStyle(
                      fontSize: 14, color: AppColors.grey
                  ),), Align(
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(

                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    controller: _valueEc,
                    cursorColor: AppColors.black,
                    autofocus: true,
                    autocorrect: true,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: Validatorless.multiple([
                      Validatorless.required('Valor obrigatório'),

                    ]),

                    style: TextStyle(
                        fontSize: 17,

                        color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_balance_wallet,
                          color: Colors.black.withOpacity(.3),),
hintText: "R\$",
                        hintStyle: TextStyle(
fontSize: 16,
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


                                final formValid = _formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  _doRegister(context, _nameEC.text, _emailEC.text,
                                      _passwordEC.text, 0);
                                  //_controller.register(
                                  // email: _emailEC.text, password: _passwordEC.text);
                                }
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
      ),
    );
  }

  _doRegister(BuildContext context,  name,  email,  password,
       value) async {
    Loader.show("GREENZANDO");
    await controller.doRegister(context);
  }
}
