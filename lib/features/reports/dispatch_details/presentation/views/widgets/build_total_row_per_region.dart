import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

Widget buildTotalRowPerRegion({
  required List<MonthDay> monthDays,
  required List<String> selectedCities,
  required num totalDelta,
  required num totalGCairo,
  required num totalUEgypt,
  required num totalCostal,
  required num totalAll,
  required num totalExport,
  required BoxBorder totalBorder,
  required QuantityType quantityType,
  required QuantityMatrial quantityMatrial,
}) {
  final areas = monthDays.first.dataValues ?? [];

  return Row(
    children: [
      ...areas.expand((area) {
        List<Widget> cells = [];

        /// ✅ 1. حط total الـ area الأول
        num areaTotal = monthDays.fold(0, (prev, day) {
          final areaItem = day.dataValues
              ?.where((d) => d.name == area.name)
              .toList();

          final current =
              (areaItem != null && areaItem.isNotEmpty) ? areaItem.first : null;

          return prev +
              getQuantityValue(
                  current?.quantity, quantityType, quantityMatrial);
        });

        cells.add(
          buildCell(
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(areaTotal),
            color: const Color(0xfffff1df),
            border: totalBorder,
            isHeader: true,
          ),
        );

        /// ✅ 2. حط المدن المختارة اللي تبع الـ area
        final cities = area.relationValues ?? [];

        final filteredCities = cities
            .where((c) => selectedCities.contains(c.name))
            .toList();

        for (var city in filteredCities) {
          final sum = monthDays.fold(0, (prev, day) {
            final dayArea = day.dataValues
                ?.where((d) => d.name == area.name)
                .toList();

            final areaItem =
                (dayArea != null && dayArea.isNotEmpty) ? dayArea.first : null;

            final cityItem = areaItem?.relationValues
                ?.where((c) => c.id == city.id)
                .toList();

            final cityData =
                (cityItem != null && cityItem.isNotEmpty) ? cityItem.first : null;

            return prev +
                getQuantityValue(
                    cityData?.quantity, quantityType, quantityMatrial).toInt();
          });

          cells.add(
            buildCell(
              NumberFormat.decimalPatternDigits(decimalDigits: 0)
                  .format(sum),
              border: totalBorder,
              isHeader: true,
            ),
          );
        }

        return cells;
      }),

      /// ✅ Total All
      buildCell(
        NumberFormat.decimalPatternDigits(decimalDigits: 0)
            .format(totalAll),
        color: const Color(0xffe9e9e7),
        border: totalBorder,
        isHeader: true,
      ),

      /// ✅ Export
      buildCell(
        NumberFormat.decimalPatternDigits(decimalDigits: 0)
            .format(totalExport),
        border: totalBorder,
        isHeader: true,
      ),
    ],
  );
}