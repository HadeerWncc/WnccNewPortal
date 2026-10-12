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
      child: LayoutBuilder(
        builder: (context, constraints) {
           final isLandscape =
      MediaQuery.orientationOf(context) == Orientation.landscape;
      
          final cardWidth = isLandscape
      ? constraints.maxWidth * 0.30
      : constraints.maxWidth * 0.4;
          return Row(
          spacing: 10,
          // runSpacing: 10,
          children: [
            CustomDailyQuotaItem(
                landingtitle: 'Pending',
                width: cardWidth,
                icon: Symbols.weight,
                data: const {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Quota',
                width: cardWidth,
                icon: Symbols.more_up,
                data: const {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Extra',
                width: cardWidth,
                icon: Symbols.priority,
                data: const {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Priority',
                width: cardWidth,
                icon: Symbols.hourglass_empty,
                data: const {
                  "Total": 0,
                  "Bags": 0,
                  "Bulk": 0,
                }),
         
          ],
        );
          
        },
         
            
      ),
    );
  }
}
