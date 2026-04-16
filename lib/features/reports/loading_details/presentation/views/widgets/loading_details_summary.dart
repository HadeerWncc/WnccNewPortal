import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/entities/loading_details_summary_entity.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/custom_summary.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_daily_quota_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_quantity_comparing.dart';

class LoadingDetailsSummary extends StatelessWidget {
  const LoadingDetailsSummary(
      {super.key, required this.loadingDetailsSummaryEntity});
  final LoadingDetailsSummaryEntity loadingDetailsSummaryEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          CustomSummary(
            landingtitle: 'Wadie',
            widthRatio: 0.3,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: NumberFormat.decimalPattern()
                  .format(loadingDetailsSummaryEntity.wadie),
            ),
          ),
          CustomSummary(
            landingtitle: 'Masry',
            widthRatio: 0.3,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: NumberFormat.decimalPattern()
                  .format(loadingDetailsSummaryEntity.masry),
            ),
          ),
          CustomSummary(
            landingtitle: 'Bulk',
            widthRatio: 0.3,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: NumberFormat.decimalPattern()
                  .format(loadingDetailsSummaryEntity.bulk),
            ),
          ),
          CustomSummary(
            landingtitle: 'Other',
            widthRatio: 0.3,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: NumberFormat.decimalPattern()
                  .format(loadingDetailsSummaryEntity.others),
            ),
          ),
          CustomSummary(
            landingtitle: 'Total',
            widthRatio: 0.3,
            icon: Symbols.weight,
            child: CustomQuantityComparing(
              mainTitle: NumberFormat.decimalPattern()
                  .format(loadingDetailsSummaryEntity.total),
            ),
          ),
        ],
      ),
    );
  }
}
