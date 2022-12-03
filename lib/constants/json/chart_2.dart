import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';

List<Color> gradientColors = [primary];

LineChartData mainData() {
  return LineChartData(
      gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 0.1,
            );
          }));
}
