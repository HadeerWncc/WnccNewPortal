import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/data_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';

Widget buildSalesTopHeader(
  List<DataValue> areas,
  List<String> selectedCities,
  ScrollController? headerController,
  {double? width = 100}
) {
  final sales = areas;

  /// 👇 المدن المختارة بس
  final filteredSales =
      sales.where((c) => selectedCities.contains(c.name)).toList();
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
              ...filteredSales.expand((area) {
                return [
                  buildCell(
                    area.name ?? "",
                    isHeader: true,
                    color: const Color(0xFFB9E2A7),
                     width: width??100,
                  ),

                ];
              }),

              /// 🔽 totals العامة
              buildCell("Total",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
              buildCell("Export",
                  isHeader: true, color: const Color(0xFFB9E2A7)),
            ],
          ),
        ),
      ),
    ],
  );
}
