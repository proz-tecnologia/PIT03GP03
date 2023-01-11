import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/json/meugreen.dart';
import 'package:green/constants/transaction/transactions_green.dart';
import 'package:green/controller/home_controller.dart';
import 'package:green/models/category.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import '../../../../constants/transaction_controller.dart';
import '../../../../helpers/Utils.dart';
import '../../../../model/meu_green_category.dart';
import 'package:green/helpers/AppColors.dart';

class MeuGreenDetailPage extends StatefulWidget {
  final int categoryId;
   MeuGreenDetailPage({ required this.categoryId,}) ;

  @override
  State<MeuGreenDetailPage> createState() => _MeuGreenDetailPageState();
}

class _MeuGreenDetailPageState extends State<MeuGreenDetailPage> {
  String ? SelectedCategories;

  final List<String>_selectCategories=[
    'food',
    'auto',
    'cash',
    'avatar'


  ];
  //controllers
  final RegExp verificNumber = RegExp(r'([0-9]{})');
  final TextEditingController _greenForm = TextEditingController(text: '');
  final TransActionController controller = TransActionController();
  final _txtDateTimeController = TextEditingController();
  final fomrKey = GlobalKey<FormState>();


//variaveis
  var transactionType = TransactionType.INCOME;
  late final transactionTypes = [
    TransactionTypeOption("Receita", TransactionType.INCOME, Colors.green),
    TransactionTypeOption("Despesa", TransactionType.EXPENSE, Colors.red)
  ];
//fuctions selects
  String ? selectedCategories;
  int activeCategory = 0;
  var _dateTime = DateTime.now();
Category? _category;

//select favorited
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
   //idiomas
    final locale = Localizations.localeOf(context);
    //mediaQuery

    Size size = MediaQuery.of(context).size;
    //lists
    List<GreenList> _greenList = GreenList.categoryList;
    List<Category> _categories=Utils.getMockedCategories();

    return Scaffold(
backgroundColor: Colors.grey.shade100,
      body: Consumer<HomeController>(builder: (context, controller, _) {
        return Container(

          child: Form(
            //key
            key: fomrKey,
            child:
                getBody(controller.transactionList, _greenList, size, locale,_categories),
          ),
        );
      }),
    );
  }

  Widget getBody(List<Transaction> transactionList, List<GreenList> _greenList,
      Size size, Locale locale, List<Category> categories) {
    return Stack(
      children: [
Column(
children: [
  Container(

width: double.infinity,
    height: 400 ,
    decoration: BoxDecoration(
        color:AppColors.primary,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      )
    ),
    child:Column(

      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
            padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          GestureDetector(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Container(
                   height: 35,
                   width: 35,

                   child: Icon(
                     Icons.arrow_back,
                     color: AppColors.white,size: 30,
                   ),
                 ),
               ),
Container(
  child:  Image.asset('assets/'+ categories[widget.categoryId].assetsName + '.png',fit: BoxFit.contain,width: 150,height: 150,),
),
            ],

          ),
        )
      ],
    )
 ),
  ]),
  Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(

              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              height: size.height * 0.5,
              width: size.width ,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [

                    Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: selectedCategories,
                          items: _selectCategories.map((e) =>  DropdownMenuItem(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    child:  Image.asset('assets/${e}.png'),
                                  ),

                                  Text(e,style: TextStyle(fontSize: 16),)
                                ],
                              ),
                            ),
                            value: e,
                          )).toList(),
                          selectedItemBuilder: (BuildContext context)=>_selectCategories.map((e) =>Row(
                            children: [

                              Container(
                                width:42 ,
                                child:  Image.asset('assets/${e}.png'),
                              ),

                              Text(e)
                            ],
                          )).toList(),

                          dropdownColor: Colors.white,
                          elevation: 1,
                          isExpanded: true,
                          autofocus: true,
                          borderRadius: BorderRadius.circular(30),
                          onChanged: ((value){
                            setState(() {
                              selectedCategories=value!;

                            });
                          }


                          ),
                        )
                    ),


      Positioned(
        bottom: 0,
         left: 0,
         right: 0,
         child: Container(

             height: size.height * 0.3,

             decoration: BoxDecoration(
              color:Colors.white54,
                 borderRadius: const BorderRadius.only(
                   topRight: Radius.circular(30),
                   topLeft: Radius.circular(30),
                 ),
              ),
               child:
                   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [


                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                 TextFormField(
                     controller: _greenForm,
                     autofocus: true,
                     autocorrect: true,
                     autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (String? value) {
                     if (value!.isEmpty) {
                        return "required_field".i18n();
                    }

                       return null;
                     },
                     onChanged: (value) => controller.title = value,
                cursorColor: Colors.black,
                     style: TextStyle(
                   fontSize: 17,
                       fontWeight: FontWeight.w500,
                         color: Colors.grey),

                 ),
                ]),


                     const SizedBox(
                   height: 16,     ),
                Text(
                  "value".i18n(),
                  style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.black),
                 ),
                TextFormField(
                  autofocus: true,
                  autocorrect: true,

                   validator: (String? valor) {
                     if (verificNumber.hasMatch(valor!) ||
                        valor.isEmpty ||
                         double.parse(valor.replaceAll(",", ".")) <= 0) {
                     return 'invalid_value'.i18n();
                   }

                   return null;
                   },
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true), cursorColor: AppColors.black,
                   style: TextStyle(
                       fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.black),
                   decoration: InputDecoration(
                   // hintText: "${'money'.i18n()} 00,00",
                    prefixIconColor: Colors.red,
                  ),
                  onChanged: (value) => controller.value = double.parse(value),
                ),           SizedBox(
            height: 35,
             ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                     ElevatedButton(
                  onPressed: () {
                        setState(() async {
                          FocusScope.of(context).requestFocus(FocusNode());
                       DateTime? date = await showDatePicker(
                           context: context,
                                 firstDate: DateTime.now()
                                  .subtract(const Duration(days: 360)),
                               lastDate: DateTime.now(),
                                initialDate: _dateTime);
                          _dateTime = date ?? _dateTime;
                        _txtDateTimeController.text =
                                "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
                           });
                     },
                         child: Icon(
                         Ionicons.calendar,
                        color: Colors.white,
                       ),
                        style: ButtonStyle(
                         fixedSize: MaterialStateProperty.all<Size>(
                               Size.fromRadius(30),
                          ),
                         foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                             backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                           shape:
                                 MaterialStateProperty.all<RoundedRectangleBorder>(     RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )))),
                  Confirmation()
    ]),
                 ]),
               )
      ),

    ]),
    ),
          )),
  ]);
  }

  Row Types() {
    return Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: transactionTypes
                      .map((e) => ChoiceChip(
elevation: 2,
                      selectedColor: e.color,
                      labelStyle: const TextStyle(color: Colors.white),
                      label: Text(e.label),
                      selected: e.type == transactionType,
                      onSelected: (value) => setState(() {
                        transactionType = e.type;
                      })))
                      .toList(),
                );
  }

  Row TransactionTypes() {
    return Row(
      children: transactionTypes
          .map((e) => ChoiceChip(
          selectedColor: e.color,
          labelStyle: const TextStyle(color: Colors.green),
          label: Text(e.label),
          selected: e.type == transactionTypes,
          onSelected: (value) => setState(() {
            transactionType = e.type;
          })))
          .toList(),
    );
  }

  SingleChildScrollView Confirmation() {
    return SingleChildScrollView(
      child: Consumer<HomeController>(builder: (context, homeController, _) {
        return Container(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    var formValid = fomrKey.currentState?.validate() ?? false;
                    var message = 'transactions_invalid'.i18n();

                    if (formValid) {
                      message = "transactions_valid".i18n();

                      var trans = Transaction(
                          value: controller.value,
                          title: controller.title,
                          category: controller.category,
                          dateTime: _dateTime,
                          transactionType: TransactionType.INCOME,
                          description: '');
                      Provider.of<HomeController>(context, listen: false)
                          .add(trans);
                      //  homeController.setTransAction(trans);
                      Navigator.pop(context);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                    ));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size.fromRadius(30),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )))),
            ],
          ),
        );
      }),
    );
  }
}

class TransactionTypeOption {
  String label;
  TransactionType type;
  Color color;

  TransactionTypeOption(this.label, this.type, this.color);
}

class DetailFeature extends StatelessWidget {
  final String detailFeature;
  final String title;

  const DetailFeature({
    Key? key,
    required this.detailFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          detailFeature,
          style: TextStyle(
            color: Colors.green,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
