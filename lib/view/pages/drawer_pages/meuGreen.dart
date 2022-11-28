import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/colors.dart';
import 'meu_green_item.dart';
import 'meugreen_saldos.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        CreatBudgetPage(),
        Center(
          child: Text('Daily Page'),
        ),
        MeuGreenCarteira(),
        Center(
          child: Text('texte'),
        ),
        Center(
          child: Text('Budget Page'),
        ),
        Center(
          child: Text('Profile'),
        ),
        Center(
            child: Text('settings')),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.today_outlined,
      Icons.calendar_month,
      Icons.wallet_sharp,
      Icons.settings
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
