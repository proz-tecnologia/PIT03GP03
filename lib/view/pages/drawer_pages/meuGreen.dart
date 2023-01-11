import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/json/meugreen.dart';
import 'package:green/model/meu_green_category.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_favorites.dart';
import 'package:green/view/pages/drawer_pages/widgets_pages/category_list_page.dart';

import 'package:ionicons/ionicons.dart';
import 'package:page_transition/page_transition.dart';

import 'meu_green_profile.dart';
import 'meugreen_saldos.dart';
import 'stats_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  List<GreenList> favorites = [];
  List<GreenList> myCart = [];
  int _bottomNavIndex = 0;

  List<Widget> pages() {
    return [
      MeuGreenCarteira(),
      CategoryListPage(),
    //  MeuGreenPag(),
      FavoritePage(
        categoryFavorited: favorites,
      ),

      MeuGreenProfile()
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getBody() {
    return IndexedStack(
      index: _bottomNavIndex,
      children: pages(),
    );
  }

  List<IconData> iconItems = [
    Ionicons.wallet_sharp,
    Ionicons.stats_chart,
    Ionicons.heart,
    Ionicons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: MeuGreenCreat(),
                  type: PageTransitionType.bottomToTop));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Colors.deepOrange,
          activeColor: Colors.green,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconItems,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;

              final List<GreenList> favoritedCategories =
                  GreenList.getFavoritedCategory();
              final List<GreenList> addedToCart =
                  GreenList.addedToCartCategory();

              favorites = favoritedCategories;
              myCart = addedToCart.toSet().toList();
            });
          }),
    );
  }
}
