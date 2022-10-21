import 'package:flutter/material.dart';


//widget  esqueceu a seenha
class TextButtonExpanded extends StatelessWidget {
  final  String label;
  const TextButtonExpanded({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              'Problemas para fazer login?',
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

//widget cadastro
class CreaterAcount extends StatelessWidget {
  const CreaterAcount({
    Key? key, required String label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              'Ainda não tenho uma conta GREEN',
              style: TextStyle(color: Colors.green[900]),
            ),
          ),
        ),
      ],
    );
  }
}

//widget login
class textButton_login extends StatelessWidget {

  final  String label;
  const textButton_login({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor:
              Color.fromARGB(255, 125, 178, 139),
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                  color: Colors.white, fontSize: 20),

            ),
          ),
        ),
      ],
    );
  }
}