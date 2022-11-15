import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _onController;
  int _pageIndex = 0;

  @override
  void initState() {
    _onController = PageController(initialPage: 0);
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _onController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                    controller: _onController,
                    image: demo_data[index].image,
                    title: demo_data[index].titlle,
                    description: demo_data[index].description),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Indicator(
                            isActive: index == _pageIndex,
                          ),
                        )),
                Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  _onController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
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
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isActive ? 12 : 4,
        width: 4,
        decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.green.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}

class Onboard {
  final String image, titlle, description;

  Onboard(
      {required this.image, required this.titlle, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
      image: 'assets/screen02.png',
      titlle: 'Bem vindo a GREEN',
      description: 'GREEN , o seu app de finanças .'),
  Onboard(
      image: 'assets/screen01.png',
      titlle: 'Com GREEN você  descomplicar  ',
      description: 'Você tem o seu controle  financeiro sem complicação.'),
  Onboard(
      image: 'assets/screenboard7.png',
      titlle:
          'Com GREEN você planeja metas que deseja realizar  com apenas um clique.',
      description: 'Economize e sonhe com GREEN.'),
];

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
            fontSize: 22,
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
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
        ),
        Spacer(),
      ],
    );
  }
}
