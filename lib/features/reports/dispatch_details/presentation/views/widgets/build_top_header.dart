import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

Widget buildTopHeader(
    List<DispatchRegion> regions, ScrollController? headerController) {
  return Row(
    children: [
      buildCell("Date",
          width: 150.0, isHeader: true, color: const Color(0xFFB9E2A7)),
      Expanded(
        child: SingleChildScrollView(
          controller: headerController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...regions
                  .where(
                      (r) => r.areaName == "Delta" || r.areaName == "Coastal")
                  .map((r) => buildCell(r.regionName ?? "",
                      isHeader: true, color: const Color(0xFFB9E2A7))),
              buildCell("Delta",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
              ...regions.where((r) => r.areaName == "Greater Cairo").map((r) =>
                  buildCell(r.regionName ?? "",
                      isHeader: true, color: const Color(0xFFB9E2A7))),
              buildCell("G.CAIRO",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
              ...regions.where((r) => r.areaName == "Upper Egypt").map((r) =>
                  buildCell(r.regionName ?? "",
                      isHeader: true, color: const Color(0xFFB9E2A7))),
              buildCell("U.EGYPT",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
              buildCell("BAGS", isHeader: true, color: const Color(0xFFB9E2A7)),
              buildCell("BULK", isHeader: true, color: const Color(0xFFB9E2A7)),
              buildCell("TOTAL",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
              buildCell("EXPORT",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
            ],
          ),
        ),
      ),
    ],
  );
}
