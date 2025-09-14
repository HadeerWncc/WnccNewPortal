import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class DailyQuotaItemList extends StatelessWidget {
  const DailyQuotaItemList({
    super.key,
    required this.date,
  });
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        CustomDailyQuotaItem(
          landingtitle: 'Date',
          icon: Symbols.calendar_month,
          widthRatio: 0.4,
          child: Text(
            DateFormat('MMMM d, y').format(date),
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        const CustomDailyQuotaItem(
          widthRatio: 0.4,
          landingtitle: 'Total',
          icon: Symbols.weight,
          child: CustomQuantityComparing(
            mainTitle: '0',
          ),
        ),
        const CustomDailyQuotaItem(
          widthRatio: 0.4,
          landingtitle: 'Bulk',
          icon: Symbols.local_shipping,
          child: CustomQuantityComparing(
            mainTitle: '0',
          ),
        ),
        const CustomDailyQuotaItem(
          widthRatio: 0.4,
          landingtitle: 'Bags',
          icon: Symbols.box,
          child: CustomQuantityComparing(
            mainTitle: '0',
          ),
        ),
      ],
    );
  }
}
