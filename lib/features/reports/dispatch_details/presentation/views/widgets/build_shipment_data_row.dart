 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

Widget buildShipmentDataRow(
      ShipmentDetailsModel shipDetails, List<DispatchRegion> regions,
      { BoxBorder? totalBorder}) {

    return Row(
      children: [
        ...regions
            .where((r) => r.areaName == "Delta" || r.areaName == "Coastal")
            .map((vr) {
          final reg = shipDetails.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(reg?.quantity?.total),
            border: totalBorder,
          );
        }),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.totalDelta?.total),
          color: const Color(0xfffff1df),
          border: totalBorder,
        ),
        ...regions.where((r) => r.areaName == "Greater Cairo").map((vr) {
          final reg = shipDetails.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(reg?.quantity?.total),
            border: totalBorder,
          );
        }),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.totalGCairo?.total),
          color: const Color(0xfffff1df),
          border: totalBorder,
        ),
        ...regions.where((r) => r.areaName == "Upper Egypt").map((vr) {
          final reg = shipDetails.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(reg?.quantity?.total),
            border: totalBorder,
          );
        }),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.totalUEgypt?.total),
          color: const Color(0xfffff1df),
          border: totalBorder,
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.totalBags?.total),
          border: totalBorder,
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.totalBulk?.total),
          border: totalBorder,
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.total?.total),
          color: const Color(0xffe9e9e7),
          border: totalBorder,
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(shipDetails.totalExport?.total),
          border: totalBorder,
        ),
      ],
    );
  }
