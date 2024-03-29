import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/controller/extract.controller.dart';
import 'package:green/helpers/AppColors.dart';
import 'package:green/stores/user.store.dart';
import 'package:green/view/pages/drawer_pages/widgets/simple_moth_year_green.dart';
import 'package:green/view/pages/home_page/widgets/app_bar_bottom_section.dart';
import 'package:green/view/pages/home_page/widgets/main_board.widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localization/localization.dart';

class MeuHistorico extends StatefulWidget {
  const MeuHistorico({Key? key}) : super(key: key);

  @override
  State<MeuHistorico> createState() => _MeuHistoricoState();
}

class _MeuHistoricoState extends State<MeuHistorico> {
  final _controllerHome = GetIt.instance.get<ControllerHome>();
  final _controllerExtract = GetIt.instance.get<ExtractController>();
  final userStore = GetIt.instance.get<UserStore>();

  DateTime? _selected;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text("extract".i18n()),
      ),
      body: Observer(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarBottomSection(
              total: _controllerExtract.total,
              limite: userStore.profile!.limite,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "extract_message".i18n(),
            )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                _selected =
                    await SimpleMonthYearPickerGreen.showMonthYearPickerDialog(
                  context: context,
                  barrierDismissible: true,
                );

                _controllerExtract.setListFilter(_selected!);
              },
              child: Icon(
                Ionicons.calendar,
                color: Colors.white,
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size.fromRadius(30),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            MainBoardWidgets(
              lista: _controllerExtract.extractListFilter,
              ishome: false,
              remove: _controllerHome.removeTransAction, //ControllerHome
              locale: locale,
              listFavorite: [],
            ),
          ],
        );
      }),
    );
  }
}
