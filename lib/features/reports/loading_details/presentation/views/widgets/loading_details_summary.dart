import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class LoadingDetailsSummary extends StatelessWidget {
  const LoadingDetailsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          CustomDailyQuotaItem(
            landingtitle: 'Wadie',
            widthRatio: 0.25,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: '2780',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Masry',
            widthRatio: 0.25,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Bulk',
            widthRatio: 0.25,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Other',
            widthRatio: 0.25,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
          CustomDailyQuotaItem(
            landingtitle: 'Total',
            widthRatio: 0.25,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: '0',
            ),
          ),
        ],
      ),
    );
  }
}