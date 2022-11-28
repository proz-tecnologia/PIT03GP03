import 'package:flutter/material.dart';

class CardsPageHome extends StatelessWidget {
  final int valor;
  final String value;
  final color;
  final String tittle;
  final String description;

  const CardsPageHome({
    Key? key,
    required this.value,
    this.color,
    required this.tittle,
    required this.description,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 200,
                height: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: valor / 100,
                              strokeWidth: 8,
                              backgroundColor: Colors.purple,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.orangeAccent),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            alignment: Alignment.center,
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            child: Text(
                              tittle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
