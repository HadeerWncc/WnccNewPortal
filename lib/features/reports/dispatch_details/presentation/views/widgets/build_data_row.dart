import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

Widget buildDataRow(MonthDay day, List<DispatchRegion> regions,
    {bool isTotal = false}) {
  final Color? rowColor = isTotal ? const Color(0xFFF1F8E9) : null;

  return Row(
    children: [
      ...regions
          .where((r) => r.areaName == "Delta" || r.areaName == "Coastal")
          .map((vr) {
        final reg = day.regions
            ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
        return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(reg?.quantity?.total),
            color: rowColor);
      }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalDelta?.total),
          color: const Color(0xfffff1df)),
      ...regions.where((r) => r.areaName == "Greater Cairo").map((vr) {
        final reg = day.regions
            ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
        return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(reg?.quantity?.total),
            color: rowColor);
      }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalGCairo?.total),
          color: const Color(0xfffff1df)),
      ...regions.where((r) => r.areaName == "Upper Egypt").map((vr) {
        final reg = day.regions
            ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
        return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(reg?.quantity?.total),
            color: rowColor);
      }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalUEgypt?.total),
          color: const Color(0xfffff1df)),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalBags?.total),
          color: rowColor),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalBulk?.total),
          color: rowColor),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.total?.total),
          color: const Color(0xffe9e9e7)),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalExport?.total),
          color: rowColor),
    ],
  );
}
