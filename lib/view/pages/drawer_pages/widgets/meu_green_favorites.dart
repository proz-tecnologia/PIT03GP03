import 'package:flutter/material.dart';
import 'package:green/model/meu_green_category.dart';

import 'meu_green_detail_page.dart';
import 'meu_green_widgets.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: widget.categoryFavorited.isEmpty
          ? Center(
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
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: widget.categoryFavorited.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return MeuGreenDetailPage(categoryId: 1);
                  }),
            ),
    );
  }
}
