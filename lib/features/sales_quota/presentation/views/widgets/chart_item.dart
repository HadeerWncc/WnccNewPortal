import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/chart_data_entity.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/chart_data.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/sf_circle_chart.dart';

class ChartItem extends StatelessWidget {
  const ChartItem({
    super.key,
    required this.title,
    required this.chartData,
  });
  final String title;
  final ChartDataEntity chartData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const ChartData(),
                SfCircleChart(
                  chartData: chartData,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
