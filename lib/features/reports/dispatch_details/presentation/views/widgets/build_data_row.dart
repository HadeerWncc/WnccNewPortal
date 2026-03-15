import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

Widget buildDataRow(
  MonthDay day,
  List<DispatchRegion> regions, {
  bool isTotal = false,
  required QuantityType quantityType,
}) {
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
                .format(getQuantityValue(reg?.quantity, quantityType)),
            color: rowColor);
      }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.totalDelta, quantityType)),
          color: const Color(0xfffff1df)),
      ...regions.where((r) => r.areaName == "Greater Cairo").map((vr) {
        final reg = day.regions
            ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
        return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(getQuantityValue(reg?.quantity,quantityType)),
            color: rowColor);
      }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.totalGCairo,quantityType)),
          color: const Color(0xfffff1df)),
      ...regions.where((r) => r.areaName == "Upper Egypt").map((vr) {
        final reg = day.regions
            ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
        return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(getQuantityValue(reg?.quantity,quantityType)),
            color: rowColor);
      }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.totalUEgypt,quantityType)),
          color: const Color(0xfffff1df)),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.totalBags,quantityType)),
          color: rowColor),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.totalBulk,quantityType)),
          color: rowColor),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.total,quantityType)),
          color: const Color(0xffe9e9e7)),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.totalExport,quantityType)),
          color: rowColor),
    ],
  );
}
