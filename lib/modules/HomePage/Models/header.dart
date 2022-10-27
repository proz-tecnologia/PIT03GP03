import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:green/utils/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../actions/menu.dart';


//  Criação da parte superior do app
/*class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10,),
               _options(),
            ],
          ),

          SizedBox(height: 10,),
          _welcomeUsers(),
          MenuItens(),

        ],

      ),
    );
  }

  //Config Profille
  _profile() {
    return GestureDetector(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: secondaryColor,
            ),

            child: IconButton(
              onPressed: () {},
              icon: const Icon(MdiIcons.account
              ),
            ),

        )
    );
  }}

// options
_options (){
  return Row(
    children: [

  GetBuilder<ControllerHomePage>(
        init: ControllerHomePage(),
        builder: (controllerHomePage) {
          return IconButton(
          onPressed: (){
            controllerHomePage.showValue();
          },
              icon: Icon(controllerHomePage.eyesValue ? MdiIcons.eyeOffOutline: MdiIcons.eyeOff ,color: Colors.black54,
              ),
          );
        }
      ),

     /* IconButton(
        onPressed: (){},
        icon: Icon(MdiIcons.helpCircleOutline,,color: Colors.white),
      ),*/
      IconButton(
        onPressed: (){},
        icon: Icon(Icons.add_alert_sharp,color:Colors.white,),
      )
    ],
  );
}

//tela de entrada
_welcomeUsers(){
  return Container(
    margin: EdgeInsets.only(left: 20,bottom: 10),
    child: const Text("Olá, GREEN",
    style:  TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w400
    ),
    ),

  );


  }
*/