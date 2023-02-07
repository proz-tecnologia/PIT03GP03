import 'package:flutter/material.dart';
import 'package:green/helpers/AppColors.dart';
import 'package:localization/localization.dart';

class AppBarBottomSection extends StatefulWidget {
  double total;
  double limite;

  AppBarBottomSection({
    Key? key,
    required this.total,
    required this.limite,
  }) : super(key: key);

  @override
  State<AppBarBottomSection> createState() => _AppBarBottomSectionState();
}

class _AppBarBottomSectionState extends State<AppBarBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: (widget.limite - widget.total) >= 0 == true
            ? AppColors.primary
            : Colors.red,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "money".i18n(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Text(widget.total.toStringAsFixed(2).replaceAll(".", ","),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    height: 0.9,
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'bills_month'.i18n(),
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1),
          ),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
