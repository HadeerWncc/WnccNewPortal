import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/widgets/doughnut_chart.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/home_chart_item.dart';

class BagsBulkSection extends StatelessWidget {
  const BagsBulkSection({
    super.key,
    required this.title,
    required this.value,
    required this.doughnutChartValues,
    required this.mode,
  });
  final String title;
  final num value;
  final Map<String, num> doughnutChartValues;
  final int mode;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatNum(value),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: mode == 0 ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: mode == 0 ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: DoughnutChart(
                chartValues: {
                  doughnutChartValues.keys.first:
                      (doughnutChartValues.values.first /
                              (doughnutChartValues.values.first +
                                  doughnutChartValues.values.last)) *
                          100,
                  doughnutChartValues.keys.last:
                      (doughnutChartValues.values.last /
                              (doughnutChartValues.values.first +
                                  doughnutChartValues.values.last)) *
                          100,
                },
              ),
            ),
            Column(
              children: [
                HomeChartItem(
                  leftBorderColor: const Color(0xff132c64),
                  bgColor: const Color(0xff029ff8),
                  title: doughnutChartValues.keys.first,
                  value: formatNum(doughnutChartValues.values.first),
                ),
                const SizedBox(height: 10),
                HomeChartItem(
                  leftBorderColor: const Color(0xff173557),
                  bgColor: const Color(0xff52cc8a),
                  title: doughnutChartValues.keys.last,
                  value: formatNum(doughnutChartValues.values.last),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
