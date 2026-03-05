import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

Widget buildTotalRow({
    required List<DispatchRegion> regions,
    required List<MonthDay> monthDays,
    required num totalDelta,
    required num totalGCairo,
    required num totalUEgypt,
    required num totalBags,
    required num totalBulk,
    required num totalAll,
    required num totalExport,
    required BoxBorder totalBorder,
  }) {
    return Row(
      children: [
        ...regions
            .where((r) => r.areaName == "Delta" || r.areaName == "Coastal")
            .map((vr) {
          num regionSum = monthDays.fold(0, (prev, day) {
            final reg = day.regions?.firstWhere(
                (r) => r.regionId == vr.regionId,
                orElse: () => vr);
            return prev + (reg?.quantity?.total ?? 0);
          });
          return buildCell(
              NumberFormat.decimalPatternDigits(decimalDigits: 0)
                  .format(regionSum),
              border: totalBorder,
              isHeader: true);
        }),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalDelta),
            color: const Color(0xfffff1df),
            border: totalBorder,
            isHeader: true),
        ...regions.where((r) => r.areaName == "Greater Cairo").map((vr) {
          num regionSum = monthDays.fold(0, (prev, day) {
            final reg = day.regions?.firstWhere(
                (r) => r.regionId == vr.regionId,
                orElse: () => vr);
            return prev + (reg?.quantity?.total ?? 0);
          });
          return buildCell(
              NumberFormat.decimalPatternDigits(decimalDigits: 0)
                  .format(regionSum),
              border: totalBorder,
              isHeader: true);
        }),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalGCairo),
            color: const Color(0xfffff1df),
            border: totalBorder,
            isHeader: true),
        ...regions.where((r) => r.areaName == "Upper Egypt").map((vr) {
          num regionSum = monthDays.fold(0, (prev, day) {
            final reg = day.regions?.firstWhere(
                (r) => r.regionId == vr.regionId,
                orElse: () => vr);
            return prev + (reg?.quantity?.total ?? 0);
          });
          return buildCell(
              NumberFormat.decimalPatternDigits(decimalDigits: 0)
                  .format(regionSum),
              border: totalBorder,
              isHeader: true);
        }),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalUEgypt),
            color: const Color(0xfffff1df),
            border: totalBorder,
            isHeader: true),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalBags),
            border: totalBorder,
            isHeader: true),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalBulk),
            border: totalBorder,
            isHeader: true),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalAll),
            color: const Color(0xffe9e9e7),
            border: totalBorder,
            isHeader: true),
        buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(totalExport),
            border: totalBorder,
            isHeader: true),
      ],
    );
  }
