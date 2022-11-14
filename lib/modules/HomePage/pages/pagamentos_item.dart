import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => OnboardingContent(
                    image: 'assets/screenboard7.png',
                    title:
                        'Com GREEN você planeja metas que deseja realizar  com apenas um clique.',
                    description: 'Economize e sonhe com GREEN.',
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                    onPressed: () {}, child: Image.asset('assets/arrow.png')),
              )
            ],
          ),
        ));
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: 100,
        ),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                fontFamily: 'sans-serif-light',
              ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        Spacer(),
      ],
    );
  }
}
