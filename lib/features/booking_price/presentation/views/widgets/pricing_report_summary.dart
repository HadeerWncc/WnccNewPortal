import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class PricingReportSummary extends StatelessWidget {
  const PricingReportSummary({super.key});

  @override
  Widget build(BuildContext context) {
    double widthRatio = .5;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          CustomDailyQuotaItem(
            landingtitle: 'Highest and Lowest Pickup',
            widthRatio: widthRatio,
            icon: Symbols.attach_money,
            child: CustomQuantityComparing(
              mainTitle: '2780 le',
              subTitle: '2680 le',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Highest and Lowest Delivery',
            widthRatio: widthRatio,
            icon: Symbols.attach_money,
            child: CustomQuantityComparing(
              mainTitle: '2780 le',
              subTitle: '2680 le',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Most Expensive Region',
            widthRatio: widthRatio,
            icon: Symbols.location_on,
            child: CustomQuantityComparing(
              mainTitle: 'Elfayoum',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Most Cheaper Region',
            widthRatio: widthRatio,
            icon: Symbols.location_on,
            child: CustomQuantityComparing(
              mainTitle: 'Elminya',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Last Updated At',
            widthRatio: widthRatio,
            icon: Symbols.calendar_today,
            child: CustomQuantityComparing(
              mainTitle: 'July 13, 2025',
            ),
          ),
        ],
      ),
    );
  }
}
