import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

Widget buildDataRowPerRegion(
  MonthDay day, {
  bool isTotal = false,
  required QuantityType quantityType,
  required QuantityMatrial quantityMatrial,
  required List<String> selectedCities,
}) {
  final Color? rowColor = isTotal ? const Color(0xFFF1F8E9) : null;

  final areas = (day.dataValues ?? []).toList();

  return Row(
    children: [
      /// ✅ Areas (regions columns)
      ...areas.expand((area) {
        List<Widget> cells = [];

        final areaValue = getQuantityValue(
          area.quantity,
          quantityType,
          quantityMatrial,
        );

        cells.add(
          buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(areaValue),
            color: const Color(0xfffff1df),
          ),
        );

        /// ✅ Cities inside each area (filtered)
        final cities = area.relationValues ?? [];

        final filteredCities =
            cities.where((c) => selectedCities.contains(c.name)).toList();

        for (var city in filteredCities) {
          final cityValue = getQuantityValue(
            city.quantity,
            quantityType,
            quantityMatrial,
          );

          cells.add(
            buildCell(
              NumberFormat.decimalPatternDigits(decimalDigits: 0)
                  .format(cityValue),
              isHeader: true,
              // color: const Color(0xfffff1df),
            ),
          );
        }

        return cells;
      }),

      /// ✅ Total
      buildCell(
        NumberFormat.decimalPatternDigits(decimalDigits: 0).format(
          getQuantityValue(day.total, quantityType, quantityMatrial),
        ),
        color: const Color(0xffe9e9e7),
        isHeader: true,
      ),

      /// ✅ Export
      buildCell(
        NumberFormat.decimalPatternDigits(decimalDigits: 0)
            .format(day.totalExport),
        color: rowColor,
        isHeader: true,
      ),
    ],
  );
}
