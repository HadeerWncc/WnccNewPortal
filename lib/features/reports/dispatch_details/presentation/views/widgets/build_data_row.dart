import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/dispatch_region.dart';
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
      // ...regions
      //     .where((r) => r.areaName == "Delta" || r.areaName == "Coastal")
      //     .map((vr) {
      //   // final reg = day.regions
      //   //     ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
      //   return buildCell(
      //       NumberFormat.decimalPatternDigits(decimalDigits: 0)
      //           .format(getQuantityValue(reg?.quantity, quantityType)),
      //       color: rowColor);
      // }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0).format(
              getQuantityValue(
                  day.dataValues?.firstWhere((d) => d.name == 'Delta').quantity,
                  quantityType)),
          color: const Color(0xfffff1df)),
      // ...regions.where((r) => r.areaName == "Greater Cairo").map((vr) {
      //   final reg = day.regions
      //       ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
      //   return buildCell(
      //       NumberFormat.decimalPatternDigits(decimalDigits: 0)
      //           .format(getQuantityValue(reg?.quantity, quantityType)),
      //       color: rowColor);
      // }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0).format(
              getQuantityValue(
                  day.dataValues
                      ?.firstWhere((d) => d.name == 'Greater Cairo')
                      .quantity,
                  quantityType)),
          color: const Color(0xfffff1df)),
      // ...regions.where((r) => r.areaName == "Upper Egypt").map((vr) {
      //   final reg = day.regions
      //       ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
      //   return buildCell(
      //       NumberFormat.decimalPatternDigits(decimalDigits: 0)
      //           .format(getQuantityValue(reg?.quantity, quantityType)),
      //       color: rowColor);
      // }),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0).format(
              getQuantityValue(
                  day.dataValues
                      ?.firstWhere((d) => d.name == 'Upper Egypt')
                      .quantity,
                  quantityType)),
          color: const Color(0xfffff1df)),
      // buildCell(
      //     NumberFormat.decimalPatternDigits(decimalDigits: 0)
      //         .format(getQuantityValue(day.totalBags, quantityType)),
      //     color: rowColor),
      // buildCell(
      //     NumberFormat.decimalPatternDigits(decimalDigits: 0)
      //         .format(getQuantityValue(day.totalBulk, quantityType)),
      //     color: rowColor),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0).format(
              getQuantityValue(
                  day.dataValues
                      ?.firstWhere((d) => d.name == 'Coastal')
                      .quantity,
                  quantityType)),
          color: const Color(0xfffff1df)),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(day.total, quantityType)),
          color: const Color(0xffe9e9e7)),
      buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(day.totalExport),
          color: rowColor),
    ],
  );
}
