import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:green/modules/HomePage/pages/pagamentos_item.dart';
import 'package:green/theme/colors.dart';
import 'package:iconsax/iconsax.dart';

import 'meu_green_item.dart';

class MeuGreen extends StatefulWidget {
  const MeuGreen({Key? key}) : super(key: key);

  @override
  State<MeuGreen> createState() => _MeuGreenState();
}

class _MeuGreenState extends State<MeuGreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        child: Icon(Icons.add, size: 25),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        CreatBudgetPage(),
        PagItem(),
        Center(
          child: Text('Daily Page'),
        ),
        Center(
          child: Text('Stats Page'),
        ),
        Center(
          child: Text('Budget Page'),
        ),
        Center(
          child: Text('Profile'),
        ),
        Center(
          child: Text('Create Budget Page'),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Iconsax.chart_3,
      Iconsax.calendar,
      Iconsax.wallet,
      Iconsax.aquarius1
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
