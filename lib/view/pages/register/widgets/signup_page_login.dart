import 'package:flutter/material.dart';
import 'package:green/view/pages/register/signup_pages/page_date.dart';

import 'package:green/view/pages/register/signup_pages/page_email.dart';
import 'package:green/view/pages/register/signup_pages/page_name.dart';
import 'package:green/view/pages/register/signup_pages/page_password.dart';
import 'package:green/view/pages/register/signup_pages/page_value.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            PageName(),
            PageEmail(),
            PagePassWord(),
            PageValue(),
            PageDate()
          ],
        ),
        Container(
          alignment: Alignment(0, 0.80),
          // child: SmoothPageIndicator(controller: _controller, count: 5, effect: JumpingDotEffect(
          //   dotHeight: 16,
          //   dotWidth: 16,
          //   jumpScale: .7,
          //   verticalOffset: 15,))
        )
      ],
    ));
  }
}
//
//         const CustomTextfield(
//           obscureText: true,
//           hintText: 'Enter Email',
//           icon: Icons.alternate_email,
//         ),
//         const CustomTextfield(
//           obscureText: false,
//           hintText: 'Email',
//           icon: Icons.person,
//         ),
//         const CustomTextfield(
//           obscureText: true,
//           hintText: 'Password',
//           icon: Icons.lock,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: Container(
//             width: size.width,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding:
//             const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             child: const Center(
//               child: Text(
//                 'Vamos Lá',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//
//         const SizedBox(
//           height: 20,
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.pushReplacement(
//                 context,
//                 PageTransition(
//                     child:  LoginPage(),
//                     type: PageTransitionType.bottomToTop));
//           },
//           child: Center(
//             child: Text.rich(
//               TextSpan(children: [
//                 TextSpan(
//                   text: 'Esqueceu sua senha? ',
//                   style: TextStyle(
//                     color: Colors.green
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'Login',
//                   style: TextStyle(
//                     color: Colors.green
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//         ),








