import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _onController;

  @override
  void initState() {
    _onController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    _onController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => OnboardingContent(
                controller: _onController,
                image: 'assets/screenboard7.png',
                title:
                    'Com GREEN você planeja metas que deseja realizar  com apenas um clique.',
                description: 'Economize e sonhe com GREEN.',
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 300, bottom: 30),
            child: ElevatedButton(
              onPressed: () {
                _onController.nextPage(
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
              child: Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            ),
          ),
        ]),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required PageController controller,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: 350,
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
