import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wncc_portal/core/models/cartesion_chart_data.dart';
import 'package:wncc_portal/core/models/chart_data.dart';

class CartesianColumnChart extends StatelessWidget {
  const CartesianColumnChart({
    super.key,
    required this.cartesionChart,
    required this.title,
  });

  final List<CartesionChartData> cartesionChart;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff4caf50))),
      height: 300,
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
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.top, // أو bottom / left / right
        ),

        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries<CustomChartData, String>>[
          ...cartesionChart.map(
            (c) {
              return ColumnSeries<CustomChartData, String>(
                // Bind data source
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                ),
                dataSource: c.data,
                xValueMapper: (CustomChartData item, _) => item.title,
                yValueMapper: (CustomChartData item, _) => item.amount,
                name: c.title,
                pointColorMapper: (CustomChartData item, _) => item.amount >= 0
                    ? (c.title == cartesionChart[0].title)
                        ? const Color(0xff4e73df)
                        : (c.title == cartesionChart[1].title)
                            ? Colors.green
                            : Colors.red
                    : Colors.red,
                color: c.title == cartesionChart[0].title
                    ? const Color(0xff4e73df)
                    : (c.title == cartesionChart[1].title)
                        ? Colors.green
                        : Colors.red,
              );
            },
          )

          // ColumnSeries<CustomChartData, String>(
          //     // Bind data source
          //     dataSource: cartesionChart,
          //     xValueMapper: (CustomChartData item, _) => item.title,
          //     yValueMapper: (CustomChartData item, _) => item.amount,
          //     name: '2026',
          //     color: const Color(0xff4e73df)),
          //     ColumnSeries<CustomChartData, String>(
          //     // Bind data source
          //     dataSource: cartesionChart,
          //     xValueMapper: (CustomChartData item, _) => item.title,
          //     yValueMapper: (CustomChartData item, _) => item.amount,
          //     name: '2025',
          //     color: const Color.fromARGB(255, 148, 172, 244)),
          //     ColumnSeries<CustomChartData, String>(
          //     // Bind data source
          //     dataSource: cartesionChart,
          //     xValueMapper: (CustomChartData item, _) => item.title,
          //     yValueMapper: (CustomChartData item, _) => item.amount,
          //     name: 'difference',
          //     color: const Color.fromARGB(255, 218, 27, 27))
        ],
      ),
    );
  }
}
