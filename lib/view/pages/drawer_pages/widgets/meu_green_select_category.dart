import 'package:flutter/material.dart';

import 'package:green/models/category.dart';

import 'package:localization/localization.dart';
import 'package:page_transition/page_transition.dart';

import 'package:provider/provider.dart';


import '../../../../constants/transaction/transactions_green.dart';
import '../../../../constants/transaction_controller.dart';
import '../../../../controller/home_controller.dart';
import '../../../../helpers/Utils.dart';
import 'meu_green_detail_page.dart';
import 'meu_green_details_page.dart';
import 'meu_green_select_page.dart';


class SelectCategory extends StatefulWidget {
  Category selectedCategory;
  SelectCategory({required this.selectedCategory});

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  final fomrKey = GlobalKey<FormState>();
  final TransActionController controller = TransActionController();
  // final TextEditingController _txtDateTimeController = TextEditingController();
  // final TextEditingController _budgetName = TextEditingController(text: '');

  final RegExp verificNumber = RegExp(r'([0-9]{})'); // informações
  int activeCategory = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Consumer<HomeController>(builder: (context, controller, __) {
        return Container(
          child: Form(
            key: fomrKey,
            child: getBody(controller.transactionList, locale),
          ),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, Locale locale) {
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }
    List<Category>categories=Utils.getMockedCategories();

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,  index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: MeuGreenDetailPage(
                                  categoryId: widget.selectedCategory.categoryId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                   width: 200,

                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                right: 20,
                                child: Container(
                                  height: 35,
                                  width: 35,

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
                                child:         Image.asset('assets/'+ categories[index].assetsName + '.png',fit: BoxFit.fitHeight,),

                              ),
                              Positioned(
                                bottom:0 ,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          Colors.black.withOpacity(0.2),
                                          Colors.transparent
                                        ],
                                      )
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,

                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text(categories[index].name,style: TextStyle(color: Colors.white70,fontSize: 18,fontWeight: FontWeight.bold,))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          decoration: BoxDecoration(
                            color:categories[index].color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                    )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: Text(
                'transactions'.i18n(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),


      // child: ListView.builder(
      //     itemCount: _greenList.length,
      //     scrollDirection: Axis.vertical,
      //     physics: const BouncingScrollPhysics(),
      //     itemBuilder: (BuildContext context, int index) {
      //       return GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 PageTransition(
      //                     child: MeuGreenDetailPage(
      //                       categoryId: _greenList[index].categoryId,
      //                     ),
      //                     type: PageTransitionType.topToBottom));
      //           },
      //           child: MeuGreenWidgetPage(
      //             index: index,
      //             greenList: _greenList,
      //           ));
      //     }),

    ])    );
  }
}
