import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class PrioritySummary extends StatelessWidget {
  const PrioritySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          CustomDailyQuotaItem(
            landingtitle: 'Quota',
            widthRatio: 0.25,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: '2780',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Extra',
            widthRatio: 0.25,
            icon: Symbols.more_up,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Priority',
            widthRatio: 0.25,
            icon: Symbols.priority,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Waiting',
            widthRatio: 0.25,
            icon: Symbols.hourglass_empty,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Dispatched',
            widthRatio: 0.25,
            icon: Symbols.local_shipping,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
        ],
      ),
    );
  }
}
