import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/chart_data_item.dart';

class ChartData extends StatelessWidget {
  const ChartData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartDataItem(
          title: 'Pickup',
          dataColor: pickupColor,
        ),
        SizedBox(
          height: 7,
        ),
        ChartDataItem(
          title: 'Delivery',
          dataColor: deliveryColor,
        ),
        SizedBox(
          height: 7,
        ),
        ChartDataItem(
          title: 'Remaining',
          dataColor: remainingColor,
        ),
      ],
    );
  }
}
