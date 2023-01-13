import 'package:flutter/material.dart';
import 'package:green/model/meu_green_category.dart';

class FavoritePage extends StatefulWidget {
  final List<GreenList> categoryFavorited;
  const FavoritePage({Key? key, required this.categoryFavorited})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/favorited.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Minhas Transações Favoritas',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ));
  }
}
