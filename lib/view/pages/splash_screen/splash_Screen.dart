import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../login/login_page.dart';
import '../onboarding_screen/Meu_green_onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/GreenSplash.json'),
        splashIconSize: 300,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.rotate,
        nextScreen: OnboardingScreen());
  }
}
