import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';

class PrioritySummaryLoading extends StatelessWidget {
  const PrioritySummaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            CustomDailyQuotaItem(
                landingtitle: 'Pending',
                widthRatio: .45,
                icon: Symbols.weight,
                data: {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Quota',
                widthRatio: .45,
                icon: Symbols.more_up,
                data: {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Extra',
                widthRatio: .45,
                icon: Symbols.priority,
                data: {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Priority',
                widthRatio: .45,
                icon: Symbols.hourglass_empty,
                data: {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Dispatched',
                widthRatio: .45,
                icon: Symbols.local_shipping,
                data: {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Remaining',
                widthRatio: .45,
                icon: Symbols.local_shipping,
                data: {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
          ],
        ),
      ),
    );
  }
}
