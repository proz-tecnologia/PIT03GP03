import 'package:flutter/material.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_detail_page.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../constants/transaction/transactions_green.dart';
import '../../../constants/transaction_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../model/meu_green_category.dart';


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
 // var _dateTime = DateTime.now();

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
                  width: size.width * .7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          )),
                      Icon(
                        Icons.mic,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
                itemCount: _greenList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: MeuGreenDetailPage(
                              categoryId: _greenList[index].categoryId,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
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
                            child: Image.asset(_greenList[index].image),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _greenList[index].category,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _greenList[index].tittle,
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
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'Transações',
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
                itemCount: _greenList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context, PageTransition(
                            child: MeuGreenDetailPage(
                              categoryId: _greenList[index].categoryId,),
                            type: PageTransitionType.rotate));
                      },
                      child: MeuGreenWidgetPage(index: index,  greenList: _greenList,));
                }),
          ),
        ],
      ),

    );
  }
}

