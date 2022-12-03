import 'package:flutter/material.dart';

import '../../../utils/theme/colors.dart';
import 'meugreen_saldos.dart';
import 'widgets/chart.dart';

class MeuGreenCart extends StatefulWidget {
  @override
  _MeuGreenCartState createState() => _MeuGreenCartState();
}

class _MeuGreenCartState extends State<MeuGreenCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.green),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5000),
          ),
        ),
        child: Column(
          children: [
            getBody(context),
          ],
        ),
      ),
    );
  }
}

Widget getBody(BuildContext context) {
  var size = MediaQuery.of(context).size;
  List expenses = [
    {
      "icon": Icons.arrow_back,
      "color": Colors.deepOrange,
      "label": "Saida",
      "cost": "R\$ 0,00"
    },
    {
      "icon": Icons.arrow_forward,
      "color": Colors.green,
      "label": "Entrada",
      "cost": "R\$ 0,00"
    }
  ];
  return SingleChildScrollView(
    child: Column(
      children: [
        TextBar(),
        GraphWidget(),
        SizedBox(
          height: 30,
        ),
        Cards(expenses, size),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(0.8),
          child: Container(
            height: 150,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

GestureDetector Cards(List<dynamic> expenses, Size size) {
  return GestureDetector(
    onTap: () {},
    child: Wrap(
        spacing: 30,
        children: List.generate(expenses.length, (index) {
          return Container(
            width: (size.width - 60) / 2,
            height: 170,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3,
                    // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: expenses[index]['color']),
                    child: Center(
                        child: Icon(
                      expenses[index]['icon'],
                      color: white,
                    )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expenses[index]['label'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff67727d)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        expenses[index]['cost'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        })),
  );
}
