// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:green/view/pages/login/login_page.dart';


class Cadastrado extends StatelessWidget {
  const Cadastrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
             textAlign: TextAlign.center,
              'GREEN FINANCE!',
              style: TextStyle(
                fontSize: 40.0,
                 color: Colors.green ,
                fontWeight: FontWeight.bold,
                //
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
             textAlign: TextAlign.center,
              ' ESTAMOS SUPER FELIZES POR TER VOCÊ NO NOSSO TIME.',
              style: TextStyle(
                fontSize: 25.0,
                 color: Colors.green ,
                fontWeight: FontWeight.bold,
                //
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
               textAlign: TextAlign.center,
              'Fique a vontade para mexer no app e conte com agente no que precisar.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.teal.shade900,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            SizedBox(height: 20.0,),
              ElevatedButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text(
                  'VOLTAR',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(360.0, 75.0),
                  backgroundColor: Color.fromARGB(255, 234, 93, 12) ,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}