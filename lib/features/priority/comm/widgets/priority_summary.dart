import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/priority/comm/models/priority_summary_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';

class PrioritySummary extends StatelessWidget {
  const PrioritySummary({super.key, required this.prioritySummary});
  final PrioritySummaryModel prioritySummary;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          // runSpacing: 10,
          children: [
            CustomDailyQuotaItem(
                landingtitle: 'Pending',
                widthRatio: .45,
                icon: Symbols.weight,
                data: {
                  "Total": parseToInt((prioritySummary.totalBulkPending! +
                          prioritySummary.totalBagsPending!)
                      .toString()),
                  "Bags":
                      parseToInt((prioritySummary.totalBagsPending!).toString()),
                  "Bulk":
                      parseToInt((prioritySummary.totalBulkPending!).toString()),
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Quota',
                widthRatio: .45,
                icon: Symbols.more_up,
                data: {
                  "Total": parseToInt((prioritySummary.totalBulkQuota! +
                          prioritySummary.totalBagsQuota!)
                      .toString()),
                  "Bags":
                      parseToInt((prioritySummary.totalBagsQuota!).toString()),
                  "Bulk":
                      parseToInt((prioritySummary.totalBulkQuota!).toString()),
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Extra',
                widthRatio: .45,
                icon: Symbols.priority,
                data: {
                  "Total": parseToInt((prioritySummary.totalBulkExtraQuota! +
                          prioritySummary.totalBagsExtraQuota!)
                      .toString()),
                  "Bags": parseToInt(
                      (prioritySummary.totalBagsExtraQuota!).toString()),
                  "Bulk": parseToInt(
                      (prioritySummary.totalBulkExtraQuota!).toString()),
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Priority',
                widthRatio: .45,
                icon: Symbols.hourglass_empty,
                data: {
                  "Total": parseToInt((prioritySummary.totalBulkPriority! +
                          prioritySummary.totalBagsPriority!)
                      .toString()),
                  "Bags":
                      parseToInt((prioritySummary.totalBagsPriority!).toString()),
                  "Bulk":
                      parseToInt((prioritySummary.totalBulkPriority!).toString()),
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Dispatched',
                widthRatio: .45,
                icon: Symbols.local_shipping,
                data: {
                  "Total": parseToInt((prioritySummary.totalBagsDispatch! +
                          prioritySummary.totalBulkDispatch!)
                      .toString()),
                  "Bags":
                      parseToInt((prioritySummary.totalBagsDispatch!).toString()),
                  "Bulk":
                      parseToInt((prioritySummary.totalBulkDispatch!).toString()),
                }),
            CustomDailyQuotaItem(
                landingtitle: 'Remaining',
                widthRatio: .45,
                icon: Symbols.local_shipping,
                data: {
                  "Total": parseToInt(((prioritySummary.totalBagsPriority! -
                              prioritySummary.totalBagsDispatch!) +
                          (prioritySummary.totalBulkPriority! -
                              prioritySummary.totalBulkDispatch!))
                      .toString()),
                  "Bags": parseToInt((prioritySummary.totalBagsPriority! -
                          prioritySummary.totalBagsDispatch!)
                      .toString()),
                  "Bulk": parseToInt((prioritySummary.totalBulkPriority! -
                          prioritySummary.totalBulkDispatch!)
                      .toString()),
                }),
          ],
        ),
      ),
    );
  }
}
