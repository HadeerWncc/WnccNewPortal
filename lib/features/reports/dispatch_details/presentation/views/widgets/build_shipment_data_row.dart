 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

Widget buildShipmentDataRow(
      ShipmentDetailsModel shipDetails, List<DispatchRegion> regions,
      { BoxBorder? totalBorder, required QuantityType quantityType}) {

    return Row(
      children: [
        ...regions
            .where((r) => r.areaName == "Delta" || r.areaName == "Coastal")
            .map((vr) {
          final reg = shipDetails.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(getQuantityValue(reg?.quantity,quantityType)),
            border: totalBorder,
            isHeader: true
          );
        }),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.totalDelta,quantityType)),
          color: const Color(0xfffff1df),
          border: totalBorder,
          isHeader: true
        ),
        ...regions.where((r) => r.areaName == "Greater Cairo").map((vr) {
          final reg = shipDetails.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(getQuantityValue(reg?.quantity,quantityType)),
            border: totalBorder,
            isHeader: true
          );
        }),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.totalGCairo,quantityType)),
          color: const Color(0xfffff1df),
          border: totalBorder,
          isHeader: true
        ),
        ...regions.where((r) => r.areaName == "Upper Egypt").map((vr) {
          final reg = shipDetails.regions
              ?.firstWhere((r) => r.regionId == vr.regionId, orElse: () => vr);
          return buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(getQuantityValue(reg?.quantity,quantityType)),
            border: totalBorder,
            isHeader: true
          );
        }),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.totalUEgypt,quantityType)),
          color: const Color(0xfffff1df),
          border: totalBorder,
          isHeader: true
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.totalBags,quantityType)),
          border: totalBorder,
          isHeader: true
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.totalBulk,quantityType)),
          border: totalBorder,
          isHeader: true
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.total,quantityType)),
          color: const Color(0xffe9e9e7),
          border: totalBorder,
          isHeader: true
        ),
        buildCell(
          NumberFormat.decimalPatternDigits(decimalDigits: 0)
              .format(getQuantityValue(shipDetails.totalExport,quantityType)),
          border: totalBorder,
          isHeader: true
        ),
      ],
    );
  }
