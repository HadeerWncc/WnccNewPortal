import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/dispatch_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/dispatch_region.dart';

import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_data_row.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_total_row.dart';

Widget buildMonthData(
    DispatchDetailsModel month,
    int index,
    List<DispatchRegion> regions,
    BoxBorder totalBorder,
    Map<int, bool> expandedMonths,
    QuantityType quantityType) {
  final isExpanded = expandedMonths[index] ?? false;

  num totalDelta = 0;
  num totalGCairo = 0;
  num totalUEgypt = 0;
  num totalCoastal = 0;
  num totalAll = 0;
  num totalExport = 0;

  for (MonthDay day in month.monthDays ?? []) {
    totalDelta += getQuantityValue(
        day.dataValues?.where((d) => d.name == 'Delta').toList()[0].quantity,
        quantityType);
    totalGCairo += getQuantityValue(
        day.dataValues
            ?.where((d) => d.name == 'Greater Cairo')
            .toList()[0]
            .quantity,
        quantityType);
    totalUEgypt += getQuantityValue(
        day.dataValues
            ?.where((d) => d.name == 'Upper Egypt')
            .toList()[0]
            .quantity,
        quantityType);
    totalCoastal += getQuantityValue(
        day.dataValues?.where((d) => d.name == 'Coastal').toList()[0].quantity,
        quantityType);
    totalAll += getQuantityValue(day.total, quantityType);
    totalExport += day.totalExport ?? 0;
  }

  return Column(
    children: [
      buildTotalRow(
        regions: regions,
        monthDays: month.monthDays ?? [],
        totalDelta: totalDelta,
        totalGCairo: totalGCairo,
        totalUEgypt: totalUEgypt,
        totalCostal: totalCoastal,
        totalAll: totalAll,
        totalExport: totalExport,
        totalBorder: totalBorder,
        quantityType: quantityType,
      ),
      if (isExpanded)
        ...(month.monthDays?.map((day) =>
                buildDataRow(day, regions, quantityType: quantityType)) ??
            []),
    ],
  );
}
