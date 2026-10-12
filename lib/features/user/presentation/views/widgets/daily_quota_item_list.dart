import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';

class DailyQuotaItemList extends StatelessWidget {
  const DailyQuotaItemList({
    super.key,
    required this.date,
  });
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
                   final isLandscape =
      MediaQuery.orientationOf(context) == Orientation.landscape;
      
          final cardWidth = isLandscape
      ? constraints.maxWidth * 0.30
      : constraints.maxWidth * 0.45;
        return Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            CustomDailyQuotaItem(
              landingtitle: 'Date',
              icon: Symbols.calendar_month,
              width: cardWidth,
              data: const {"Total": 1000, "Bags": 500, "Bulk": 500},
            ),
            CustomDailyQuotaItem(
              width: cardWidth,
              landingtitle: 'Total',
              icon: Symbols.weight,
              data: const {"Total": 1000, "Bags": 500, "Bulk": 500},
            ),
            CustomDailyQuotaItem(
              width: cardWidth,
              landingtitle: 'Bulk',
              icon: Symbols.local_shipping,
              data: const {"Total": 1000, "Bags": 500, "Bulk": 500},
            ),
            CustomDailyQuotaItem(
              width: cardWidth,
              landingtitle: 'Bags',
              icon: Symbols.box,
              data: const {"Total": 1000, "Bags": 500, "Bulk": 500},
            ),
          ],
        );
      },
    );
  }
}
