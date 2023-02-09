import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:simple_month_year_picker/custom.dialog.dart';
import 'package:simple_month_year_picker/month.container.dart';
import 'package:simple_month_year_picker/month.model.dart';

class SimpleMonthYearPickerGreen {
  static final List<MonthModel> _monthModelList = <MonthModel>[
    MonthModel(index: 1, name: 'jan'),
    MonthModel(index: 2, name: 'feb'),
    MonthModel(index: 3, name: 'mar'),
    MonthModel(index: 4, name: 'apr'),
    MonthModel(index: 5, name: 'may'),
    MonthModel(index: 6, name: 'jun'),
    MonthModel(index: 7, name: 'jul'),
    MonthModel(index: 8, name: 'aug'),
    MonthModel(index: 9, name: 'sep'),
    MonthModel(index: 10, name: 'oct'),
    MonthModel(index: 11, name: 'nov'),
    MonthModel(index: 12, name: 'dec'),
  ];

  static Future<DateTime> showMonthYearPickerDialog({
    required BuildContext context,
    String? titleFontFamily,
    String? yearTextFontFamily,
    String? monthTextFontFamily,
    Color? backgroundColor,
    Color? selectionColor,
    bool? barrierDismissible,
  }) async {
    final ThemeData theme = Theme.of(context);
    var primaryColor = selectionColor ?? theme.primaryColor;
    var bgColor = backgroundColor ?? theme.scaffoldBackgroundColor;
    //var textTheme = theme.textTheme;

    /// to get current year
    int selectedYear = DateTime.now().year;

    /// to get index corresponding to current month (1- Jan, 2- Feb,..)
    var selectedMonth = DateTime.now().month;

    await showDialog<DateTime>(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return CustomDialog(
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: 370,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          'select'.i18n(),
                          style: TextStyle(
                            fontFamily: titleFontFamily ?? 'Rajdhani',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 5),
                        child: SizedBox(
                          height: 100,
                          width: 300,
                          child: GridView.builder(
                            itemCount: _monthModelList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                            ),
                            itemBuilder: (_, index) {
                              var monthModel = _monthModelList[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedMonth = index + 1;
                                  });
                                },
                                onHover: (val) {},
                                child: MonthContainer(
                                  fontFamily: monthTextFontFamily ?? 'Rajdhani',
                                  month: monthModel.name.i18n(),
                                  fillColor: index + 1 == selectedMonth
                                      ? primaryColor
                                      : bgColor,
                                  borderColor: index + 1 == selectedMonth
                                      ? primaryColor
                                      : bgColor,
                                  textColor: index + 1 != selectedMonth
                                      ? primaryColor
                                      : bgColor,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: bgColor,
                                border: Border.all(
                                  color: primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'cancel'.i18n(),
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              String selectedMonthString = selectedMonth < 10
                                  ? "0$selectedMonth"
                                  : "$selectedMonth";
                              var selectedDate = DateTime.parse(
                                  '$selectedYear-$selectedMonthString-01');

                              Navigator.pop(context, selectedDate);
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(
                                  color: primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: bgColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 10,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedYear = selectedYear - 1;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          selectedYear.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: yearTextFontFamily ?? 'Rajdhani',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedYear = selectedYear + 1;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );

    String selectedMonthString =
        selectedMonth < 10 ? "0$selectedMonth" : "$selectedMonth";

    return DateTime.parse('$selectedYear-$selectedMonthString-01');
  }
}
