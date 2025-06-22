import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/sales_quota/data/models/chart_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/chart_data_entity.dart';

class SfCircleChart extends StatelessWidget {
  const SfCircleChart({
    super.key,
    required this.chartData,
  });
  final ChartDataEntity chartData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      height: 100,
      child: SfCircularChart(
        margin: const EdgeInsets.all(0),
        series: <DoughnutSeries<ChartModel, String>>[
          DoughnutSeries<ChartModel, String>(
            dataSource: [
              ChartModel('Pickup', chartData.pickup.toDouble(), pickupColor),
              ChartModel(
                  'Delivery', chartData.delivery.toDouble(), deliveryColor),
              ChartModel(
                  'Remaning', chartData.remaining.toDouble(), remainingColor),
            ],
            xValueMapper: (ChartModel data, _) => data.category,
            yValueMapper: (ChartModel data, _) => data.value,
            pointColorMapper: (ChartModel data, _) => data.color,
          )
        ],
      ),
    );
  }
}
