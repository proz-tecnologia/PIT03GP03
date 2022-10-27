import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:green/utils/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class MenuItens extends StatelessWidget {
  const MenuItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,//direção do meu widget
          children: [
        _itemMenu(
        icon://ImageIcon(AssetImage('assets/metas.png')),
        Icons.settings_system_daydream,
        name: 'Metas',
        isFirst: true),

            _itemMenu(
                icon://ImageIcon(AssetImage('assets/pagamentos.png')),
                MdiIcons.cash,
                name: 'Pagamentos'),

            _itemMenu(
                icon://ImageIcon(AssetImage('assets/contas.png')),
                Icons.app_shortcut,
                name: 'App Green'
                ),
            _itemMenu(
                icon://ImageIcon(AssetImage('assets/contas.png')),
                Icons.auto_graph,
                name: 'Meu Green'),

            _itemMenu(
                icon://ImageIcon(AssetImage('assets/contas.png')),
      Icons.app_settings_alt,
                name: 'Configurações'),

          ],
        ),
      ),
    );
  }

_itemMenu({required IconData icon, required String name,bool ? isFirst }){
return Container(

    padding:(isFirst ?? false) ? const EdgeInsets.only(right: 7,left: 20 ) : const EdgeInsets.symmetric(horizontal:7),
  child: Column(
  children: [
  Container(

  margin:const EdgeInsets.only(bottom: 10),
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
  color:Colors.white ,borderRadius: BorderRadius.circular(48),
  ),
  child: Icon(icon,size: 35,color: backgroundColor,),
  ),

 Text(name,
  style: const TextStyle(fontSize: 16,color: Colors.white
  ),
  ),
  ],
  ),
    );
}
}