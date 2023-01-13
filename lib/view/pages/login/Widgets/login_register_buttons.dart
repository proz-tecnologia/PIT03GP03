import 'package:flutter/material.dart';
import 'green_button_with.dart';
//part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        GreenButtonWith(
          onTap: () {},
          color: Color(0xFF4267B3),
          icon: Icons.facebook,
          label: "Faceboook",
        ),
        GreenButtonWith(
          onTap: () {},
          color: Color(0xFFE15031),
          icon: Icons.g_mobiledata,
          label: "Google",
        ),
        GreenButtonWith(
          onTap: () {},
          color: const Color.fromARGB(255, 125, 178, 139),
          icon: Icons.mail,
          label: "Cadastre-se",
        ),
      ],
    );
  }
}
