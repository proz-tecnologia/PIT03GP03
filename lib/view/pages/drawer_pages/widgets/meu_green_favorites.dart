import 'package:flutter/material.dart';
import 'package:green/helpers/AppColors.dart';
import 'package:green/model/meu_green_category.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_widgets.dart';



class FavoritePage extends StatelessWidget {

  final List<GreenList> categoryFavorited;
  FavoritePage({Key? key, required this.categoryFavorited, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:categoryFavorited.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/sub10.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your favorited Green',
              style: TextStyle(
                color: AppColors.primary,
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
            itemCount: categoryFavorited.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {

              return MeuGreenWidgetPage(
                  index: index,
                  greenList: categoryFavorited, );
            }),
      ),
    );
  }
}