import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:green/model/meu_green_category.dart';
import 'package:green/view/pages/drawer_pages/chart_page.dart';

import 'package:ionicons/ionicons.dart';

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
      MeuGreenCreat(),
      ChartPage()
      //  CategoryListPage(),
      //  MeuGreenPag(),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          rightCornerRadius: 50,
          leftCornerRadius: 50,
          splashColor: Colors.deepOrange,
          splashRadius: 60,
          splashSpeedInMilliseconds: 800,
          activeColor: Colors.green,
          inactiveColor: Colors.black.withOpacity(.3),
          icons: iconItems,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.sharpEdge,
          backgroundColor: Colors.grey.withOpacity(0.1),
          elevation: 0,
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
