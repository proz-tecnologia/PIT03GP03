import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/models/bar_char.models.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final controller = GetIt.instance.get<ControllerHome>();

  @override
  void initState() {
    controller.initChart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<charts.Series<BarCharModel, String>> series = [
      charts.Series(
        id: 'total',
        data: controller.chartList,
        domainFn: (BarCharModel series, _) => series.categoria,
        measureFn: (BarCharModel series, _) => series.total,
        colorFn: (BarCharModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.6,
              width: size.width,
              padding: const EdgeInsets.all(8.0),
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
