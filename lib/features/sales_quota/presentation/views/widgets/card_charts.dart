import 'package:flutter/material.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/chart_data_entity.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/chart_item.dart';

class CardCharts extends StatelessWidget {
  const CardCharts({
    super.key,
    required this.quota,
    required this.priority,
    required this.dispatch,
  });

  final ChartDataEntity quota;
  final ChartDataEntity priority;
  final ChartDataEntity dispatch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartItem(
          title: 'Quota',
          chartData: quota,
        ),
        ChartItem(
          title: 'Priority',
          chartData: priority,
        ),
        ChartItem(
          title: 'Dispatched',
          chartData: dispatch,
        )
      ],
    );
  }
}
