import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarCharModel {
  String legenda;
  String categoria;
  double total;
  final charts.Color color;
  final Color? background;
  final String assetsName;

  BarCharModel({
    required this.legenda,
    required this.categoria,
    required this.total,
    required this.color,
    required this.background,
    required this.assetsName,
  });
}
