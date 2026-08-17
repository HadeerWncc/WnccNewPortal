import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key, required this.chartValues});
  final Map<String, num> chartValues;
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(chartValues.keys.first, chartValues.values.first.toDouble(),
          const Color(0xff029ff8)),
      ChartData(chartValues.keys.last, chartValues.values.last.toDouble(),
          const Color(0xff55ca8e)),
    ];
    return SfCircularChart(margin: EdgeInsets.all(0), series: <CircularSeries>[
      // Renders doughnut chart
      DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ]);
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
