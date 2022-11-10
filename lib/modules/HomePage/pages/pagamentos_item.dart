import 'package:flutter/material.dart';

import '../../../json/day_month.dart';
import '../../../theme/colors.dart';

class PagItem extends StatefulWidget {
  const PagItem({Key? key}) : super(key: key);

  @override
  State<PagItem> createState() => _PagItemState();
}

class _PagItemState extends State<PagItem> {
  int activeMonth = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.1),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 4,
          )
        ]),
        child: Padding(
            padding: EdgeInsets.only(top: 60, bottom: 25, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Pagamentos',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kailasa',
                          color: Colors.black),
                    ),
                    Icon(Icons.search_outlined),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(days.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          activeMonth = index;
                        });
                      },
                      child: Container(
                        width: (size.width - 40) / 7,
                        child: Column(
                          children: [
                            Text(
                              days[index]['dia'],
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: activeMonth == index
                                    ? primary
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: activeMonth == index
                                      ? primary
                                      : black.withOpacity(0.1),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  months[index]['label'],
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: activeMonth == index
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            )),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 4,
                ),
              ]),
        ),
      )
    ]));
  }
}
