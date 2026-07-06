import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/data_value.dart';

Widget buildRegionTopHeader(
  List<DataValue> areas,
  List<String> selectedCities,
  ScrollController? headerController,
) {
  return Row(
    children: [
      buildCell(
        "Date",
        width: 150.0,
        isHeader: true,
        color: const Color(0xFFB9E2A7),
      ),
      Expanded(
        child: SingleChildScrollView(
          controller: headerController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...areas.expand((area) {
                final cities = area.relationValues ?? [];

                /// 👇 المدن المختارة بس
                final filteredCities = cities
                    .where((c) => selectedCities.contains(c.name))
                    .toList();

                return [
                  /// 🔹 Area Title (زي Delta)
                  buildCell(
                    area.name ?? "",
                    isHeader: true,
                    color: const Color(0xFFB9E2A7),
                  ),

                  /// 🔹 Cities اللي user اختارها
                  ...filteredCities.map(
                    (city) => buildCell(
                      city.name ?? "",
                      isHeader: true,
                      color: const Color(0xFFB9E2A7),
                    ),
                  ),
                ];
              }),

              /// 🔽 totals العامة
              buildCell("Total",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
            ],
          ),
        ),
      ),
    ],
  );
}
