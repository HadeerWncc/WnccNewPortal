import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/build_table_data.dart';

class CurrencyDonutCard extends StatelessWidget {
  final List<CurrencyChartData> chartData;

  const CurrencyDonutCard({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff4caf50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== Title =====
          const Text(
            "Currency Details",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),

          const Text(
            "Distribution by currency type",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),
          const Divider(),

          /// ===== Donut Chart =====
          SizedBox(
            height: 180,
            child: SfCircularChart(
              legend: const Legend(
                isVisible: true,
                position: LegendPosition.left,
              ),
              series: <CircularSeries>[
                DoughnutSeries<CurrencyChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (d, _) => d.currency,
                  yValueMapper: (d, _) => d.amount,
                  dataLabelMapper: (d, _) {
                    final total =
                        chartData.fold<num>(0, (s, e) => s + e.amount);
                    final percent = (d.amount / total) * 100;
                    return "${percent.toStringAsFixed(3)}%";
                  },
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                  innerRadius: "50%",
                  radius: "80%",
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// ===== Totals row =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: chartData.map((e) {
              return Column(
                children: [
                  Text(
                    _format(e.amount),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    e.currency,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _format(num n) {
    return NumberFormat.decimalPattern().format(n);
  }
}
