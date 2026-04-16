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
    return const Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        CustomDailyQuotaItem(
          landingtitle: 'Date',
          icon: Symbols.calendar_month,
          widthRatio: 0.4,
          data: {"Total": 1000, "Bags": 500, "Bulk": 500},
        ),
        CustomDailyQuotaItem(
          widthRatio: 0.4,
          landingtitle: 'Total',
          icon: Symbols.weight,
          data: {"Total": 1000, "Bags": 500, "Bulk": 500},
        ),
        CustomDailyQuotaItem(
          widthRatio: 0.4,
          landingtitle: 'Bulk',
          icon: Symbols.local_shipping,
          data: {"Total": 1000, "Bags": 500, "Bulk": 500},
        ),
        CustomDailyQuotaItem(
          widthRatio: 0.4,
          landingtitle: 'Bags',
          icon: Symbols.box,
          data: {"Total": 1000, "Bags": 500, "Bulk": 500},
        ),
      ],
    );
  }
}
