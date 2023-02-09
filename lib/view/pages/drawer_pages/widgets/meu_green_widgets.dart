import 'package:flutter/cupertino.dart';
import 'package:green/helpers/AppColors.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../model/meu_green_category.dart';
import 'meu_green_detail_page.dart';

class MeuGreenWidgetPage extends StatelessWidget {
  MeuGreenWidgetPage({
    Key? key,
    required this.index,
    required this.greenList,
  }) : super(key: key);

  final int index;
  final List<GreenList> greenList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: MeuGreenDetailPage(
                  categoryId: greenList[index].categoryId,
                  assetsName: greenList[index].image,
                  listSub: [],
                  categorieName: greenList[index].tittle,
                  isSelect: false,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(greenList[index].image),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(greenList[index].category),
                      Text(
                        greenList[index].tittle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
