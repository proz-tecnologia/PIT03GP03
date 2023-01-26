import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/core/ui/widgets/loader.dart';
import 'package:green/view/pages/login/Widgets/green_textform_fileld.dart';
import 'package:green/view/pages/register/controller/register_controller.dart';
import 'package:localization/localization.dart';
import 'package:page_transition/page_transition.dart';
import 'package:validatorless/validatorless.dart';
//import '../../login/custom_text.dart';
import '../../login/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final controller = GetIt.instance.get<RegisterController>();
  //final _controller = GetIt.instance.get<ControllerRegister>();

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.70,
                height: size.height * 0.40,
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),
              Text(
                "Cadastro",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*const CustomTextfield(
                obscureText: true,
                hintText: 'Enter Email',
                icon: Icons.alternate_email,
              ),*/
              GreenTextFormField(
                label: "Nome",
                controller: _nameEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Nome obrigatório'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              GreenTextFormField(
                label: 'email'.i18n(),
                controller: _emailEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Email obrigatório'),
                  Validatorless.email('Email não válido'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              GreenTextFormField(
                label: 'password'.i18n(),
                obscureText: true,
                controller: _passwordEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Senha obrigatória'),
                  Validatorless.min(
                      6, 'Senha deve conter ao menos 6 caracteres')
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              GreenTextFormField(
                label: 'password'.i18n(),
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required("Confirmação de senha obrigatória"),
                  Validatorless.compare(
                      _passwordEC, "Senha e confirma senha não são iguais")
                ]),
              ),
              /*const CustomTextfield(
                obscureText: false,
                hintText: 'Email',
                icon: Icons.person,
              ),
              const CustomTextfield(
                obscureText: true,
                hintText: 'Password',
                icon: Icons.lock,
              ),*/
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  final formValid = _formKey.currentState?.validate() ?? false;

                  if (formValid) {
                    _doRegister(context, _nameEC.text, _emailEC.text,
                        _passwordEC.text, 0);
                    //_controller.register(
                    // email: _emailEC.text, password: _passwordEC.text);
                  }
                },
                child: Center(
                  child: Container(
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: const Center(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: LoginPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Esqueceu sua senha? ',
                        style: TextStyle(color: Colors.green),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(color: Colors.green),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _doRegister(BuildContext context, String name, String email, String password,
      double limite) async {
    Loader.show("Cadastrando...");
    await controller.doRegister(name, email, password, limite, context);

    /*final response = 
    if (response.isSuccess) {
      Loader.hide();
      //print("SUCESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
      Mensagens.sucess("Cadastro realizado com sucesso!!");
      //Navigator.pushReplacementNamed(context, "/home");
    } else {
      Loader.hide();
      //_alertDialog.showInfo(title: "Ops!", message: response.message!);
      Mensagens.alert(response.message!);
    }*/
  }
}
