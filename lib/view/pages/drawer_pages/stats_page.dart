import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/models/category.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_detail_page.dart';
import 'package:green/view/pages/home_page/widgets/main_board.widgets.dart';

import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants/transaction/transactions_green.dart';
import '../../../constants/transaction_controller.dart';

class MeuGreenCreat extends StatefulWidget {
  @override
  _MeuGreenCreatState createState() => _MeuGreenCreatState();
}

class _MeuGreenCreatState extends State<MeuGreenCreat> {
  final fomrKey = GlobalKey<FormState>();
  final TransActionController controller = TransActionController();

  // final TextEditingController _txtDateTimeController = TextEditingController();
  // final TextEditingController _budgetName = TextEditingController(text: '');

  final RegExp verificNumber = RegExp(r'([0-9]{})'); // informações
  int activeCategory = 0;

  //controller
  final _controller = GetIt.instance.get<ControllerHome>();

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Observer(builder: (context) {
        return Container(
          child: Form(
            key: fomrKey,
            child: getBody(_controller.transactionList, locale,
                _controller.categoriesList),
          ),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, Locale locale,
      List<Category> categories) {
    final _controller = GetIt.instance.get<ControllerHome>();

    /*bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }*/

    //List<Category> categories = Utils.getMockedCategories();
    //List<GreenList> _greenList = GreenList.categoryList;
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "moviments".i18n(),
              style: TextStyle(fontFamily: 'Savoye Let', fontSize: 28),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: MeuGreenDetailPage(
                              categoryId: categories[index].categoryId,
                              categorieName: categories[index].name,
                              assetsName: categories[index].assetsName,
                              listSub: categories[index].subCategory,
                              isSelect: false,
                            ),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                    width: 170,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.favoriteCategorie(index);
                                });
                              },
                              icon: Icon(
                                categories[index].isFavorited == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              iconSize: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(
                              'assets/' + categories[index].assetsName + '.png',
                              fit: BoxFit.contain),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (categories[index].nameInter).i18n(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: categories[index].color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: Text(
              'transactions'.i18n(),
              style: TextStyle(
                fontFamily: 'San Francisco',
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: MainBoardWidgets(
              listFavorite: [],
              lista: _controller.transactionList,
              locale: locale,
              remove: _controller.removeTransAction,
              ishome: false,
            ),
          ),
          /*Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: transactionList.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green.withOpacity(0.1)),
                  ),
                  child: Image.asset(
                    'assets/' + categories[index].assetsName + '.png',
                    fit: BoxFit.cover,
                    width: 45,
                    height: 45,
                  ),
                ),
                title: Text(categories[index].name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Savoye Let',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                subtitle: Text(
                  DateFormat(DateFormat.YEAR_MONTH_DAY, locale.toString())
                      .format(transactionList[index].data!),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Text(
                  '${'money'.i18n()} ${transactionList[index].value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: "Savoye Let",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
