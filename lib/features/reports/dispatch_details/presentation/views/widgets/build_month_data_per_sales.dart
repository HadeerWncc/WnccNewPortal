import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_data_row_per_sales.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_total_row_per_sales.dart';

Widget buildMonthDataPerSales(
  DispatchDetailsModel month,
  int index,
  List<String> items,
  BoxBorder totalBorder,
  Map<int, bool> expandedMonths,
  QuantityType quantityType,
  QuantityMatrial quantityMatrial, {
  double? width = 100,
}) {
  final isExpanded = expandedMonths[index] ?? false;

  num totalAll = 0;
  num totalExport = 0;

  for (MonthDay day in month.monthDays ?? []) {
    totalAll += getQuantityValue(
      day.total,
      quantityType,
      quantityMatrial,
    );
    totalExport += day.totalExport ?? 0;
  }

  return Column(
    children: [
      buildTotalRowPerSales(
          // regions: regions,
          selecteditems: items,
          monthDays: month.monthDays ?? [],
          totalAll: totalAll,
          totalExport: totalExport,
          totalBorder: totalBorder,
          quantityType: quantityType,
          quantityMatrial: quantityMatrial,
          width: width),
      if (isExpanded)
        ...(month.monthDays?.map((day) => buildDataRowPerSales(
                  day,
                  quantityType: quantityType,
                  quantityMatrial: quantityMatrial,
                  selectedItems: items,
                  width: width,
                )) ??
            []),
    ],
  );
}
