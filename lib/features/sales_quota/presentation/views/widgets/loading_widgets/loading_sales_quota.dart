import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_card_data.dart';

class LoadingSalesQuota extends StatelessWidget {
  const LoadingSalesQuota({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Column(
        children: [
          LoadingCardData(),
          // (selectedQuota == "Bags")
          //     ? CardCharts(
          //         quota: ChartDataEntity(
          //           pickup: chartBagsData.pickup,
          //           delivery: chartBagsData.delivery,
          //           remaining: chartBagsData.remaining,
          //         ),
          //         priority: ChartDataEntity(
          //           pickup: chartBagsDataPriority.pickup,
          //           delivery: chartBagsDataPriority.delivery,
          //           remaining: chartBagsDataPriority.remaining,
          //         ),
          //         dispatch: ChartDataEntity(
          //             pickup: 20, delivery: 40, remaining: 40),
          //       )
          //     : CardCharts(
          //         quota: ChartDataEntity(
          //           pickup: chartBulkData.pickup,
          //           delivery: chartBulkData.delivery,
          //           remaining: chartBulkData.remaining,
          //         ),
          //         priority: ChartDataEntity(
          //           pickup: chartBulkDataPriority.pickup,
          //           delivery: chartBulkDataPriority.delivery,
          //           remaining: chartBulkDataPriority.remaining,
          //         ),
          //         dispatch: ChartDataEntity(
          //             pickup: 20, delivery: 40, remaining: 40),
          //       ),
        ],
      ),
    );
  }
}