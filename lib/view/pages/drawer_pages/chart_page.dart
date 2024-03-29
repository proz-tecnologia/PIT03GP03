import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/constants/app_text_styles.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/models/bar_char.models.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:localization/localization.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final _controller = GetIt.instance.get<ControllerHome>();

  @override
  void initState() {
    _controller.initChart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<charts.Series<BarCharModel, String>> series = [
      charts.Series(
        id: 'total',
        data: _controller.chartList,
        domainFn: (BarCharModel series, _) => series.legenda,
        measureFn: (BarCharModel series, _) => series.total,
        colorFn: (BarCharModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Chart Page',
          style: TextStyle(fontFamily: 'sans-serif-light', fontSize: 13),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: size.height * 0.6,
              width: size.width,
              padding: const EdgeInsets.all(8.0),
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            getInfoChart(size),
          ],
        ),
      ),
    );
  }

  Widget getInfoChart(var size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.2,
          child: ListView.builder(
            itemCount: _controller.chartList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    children: [
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Text(
                              "${((_controller.chartList[index].total / _controller.total) * 100).toStringAsFixed(1)}%",
                              style: AppStyles.black16900Khang18,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 50,
                        bottom: 50,
                        child: Image.asset(
                            'assets/' +
                                _controller.chartList[index].assetsName +
                                '.png',
                            fit: BoxFit.fill),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (_controller.chartList[index].categoria).i18n(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: _controller.chartList[index].background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
