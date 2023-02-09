import 'package:charts_flutter_new/flutter.dart' as charts;

class BarCharModel {
  String categoria;
  double total;
  final charts.Color color;

  BarCharModel({
    required this.categoria,
    required this.total,
    required this.color,
  });
}
