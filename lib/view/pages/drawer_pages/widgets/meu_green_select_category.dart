
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green/models/category.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import '../../../../constants/json/meugreen.dart';
import '../../../../constants/json/meugreen.dart';
import '../../../../constants/transaction/transactions_green.dart';
import '../../../../constants/transaction_controller.dart';
import '../../../../controller/home_controller.dart';
import '../../../../helpers/Utils.dart';
import 'meu_green_detail_page.dart';



class SelectCategory extends StatelessWidget {
  Category  selectedCategory;
  SelectCategory ({ required this.selectedCategory});

  final TransActionController controller = TransActionController();

  int activeCategory = 0;

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Consumer<HomeController>(builder: (context, controller, __) {
        return Container(
            child: getBody(controller.transactionList, locale,size),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, Locale locale ,Size size) {
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }
    List<Category>categories=Utils.getMockedCategories();


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
              height: size.height * 0.3,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,  index) => GestureDetector(
                      onTap: () {



                            Navigator.push(context,MaterialPageRoute(builder: (context)=>MeuGreenDetailPage(categoryId: 0, assetsName: '', listSub: [], name: '', isSelect: false,)));
                      },
                      child: Container(
                   width: 170,

                          margin: const EdgeInsets.symmetric(horizontal: 12),
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
                                child:  Image.asset('assets/'+ categories[index].assetsName + '.png',fit: BoxFit.contain),

                              ),
                              Positioned(
                                bottom:0 ,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 90,
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
