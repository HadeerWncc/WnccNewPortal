import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wncc_portal/core/models/stached_chart_data.dart';

class StackedLineChart extends StatelessWidget {
  const StackedLineChart({
    super.key,
    required this.stackedData,
    required this.title,
  });

  final Map<String, List<StackedChartData>> stackedData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xff4caf50))),
        height: 200,
        child: SfCartesianChart(
          title: ChartTitle(text: title),
          primaryXAxis: const CategoryAxis(),
          series: stackedData.entries.map((entry) {
            return StackedLineSeries<StackedChartData, String>(
              name: entry.key, // اسم البنك
              dataSource: entry.value,
              xValueMapper: (data, _) => data.date,
              yValueMapper: (data, _) => data.amount,
              markerSettings: const MarkerSettings(isVisible: true),
            );
          }).toList(),
        ));
  }
}
