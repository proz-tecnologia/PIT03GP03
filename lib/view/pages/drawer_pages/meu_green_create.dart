import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/models/category.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import '../../../constants/transaction/transactions_green.dart';
import '../../../constants/transaction_controller.dart';
import '../../../helpers/Utils.dart';
import '../../../model/meu_green_category.dart';

class MeuGreenCart extends StatefulWidget {
  Category selectedCategory;
  MeuGreenCart({required this.selectedCategory});

  @override
  _MeuGreenCartState createState() => _MeuGreenCartState();
}

class _MeuGreenCartState extends State<MeuGreenCart> {
  final TransActionController controller = TransActionController();

  final _controller = GetIt.instance.get<ControllerHome>();

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
      body: Observer(builder: (context) {
        return Container(
          child: getBody(_controller.transactionList, locale),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, Locale locale) {
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    List<Category> categories = Utils.getMockedCategories();
    List<GreenList> _greenList = GreenList.categoryList;
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
          height: size.height * 0.3,
          child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    //         Navigator.push(context,MaterialPageRoute(builder: (context)=>()));
                  },
                  child: Container(
                    width: 170,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 35,
                            width: 35,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  bool isFavorited = toggleIsFavorated(
                                      _greenList[index].isFavorated);
                                  _greenList[index].isFavorated = isFavorited;
                                });
                              },
                              icon: Icon(
                                _greenList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              iconSize: 20,
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
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.black.withOpacity(0.2),
                                    Colors.transparent
                                  ],
                                )),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text(categories[index].name,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: categories[index].color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              }),
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
        Container(
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
                child: Image.asset(_greenList[index].image,
                    fit: BoxFit.cover, width: 45, height: 45),
              ),
              title: Text(_greenList[index].tittle,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontFamily: 'sans-serif-light',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              subtitle: Text(
                DateFormat(DateFormat.YEAR_MONTH_DAY, locale.toString())
                    .format(transactionList[index].data),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Text(
                '${'money'.i18n()} ${transactionList[index].value.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    )

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

        );
  }
}
