import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wncc_portal/core/models/chart_data.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({
    super.key,
    required this.barChart,
    required this.title,
  });

  final List<CustomChartData> barChart;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff4caf50))),
      height: 200,
      child: SfCartesianChart(
          title: ChartTitle(
            text: title,
            alignment: ChartAlignment.center,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Initialize category axis
          primaryXAxis: const CategoryAxis(),
          series: <ColumnSeries<CustomChartData, String>>[
            ColumnSeries<CustomChartData, String>(
                // Bind data source
                dataSource: barChart,
                xValueMapper: (CustomChartData sales, _) => sales.title,
                yValueMapper: (CustomChartData sales, _) => sales.amount,
                color: const Color(0xff4caf50))
          ]),
    );
  }
}
