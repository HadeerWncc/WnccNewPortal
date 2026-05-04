
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_details_model/month_day.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/entities/quantity_type.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_cell.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_dispatch_details_table.dart';

Widget buildDataRowPerSales(
  MonthDay day, {
  bool isTotal = false,
  double? width,
  required QuantityType quantityType,
  required QuantityMatrial quantityMatrial,
  required List<String> selectedItems,
}) {
  final Color? rowColor = isTotal ? const Color(0xFFF1F8E9) : null;

  final sales = (day.dataValues ?? []).toList();
  final filteredSales =
            sales.where((c) => selectedItems.contains(c.name)).toList();
  return Row(
    children: [
      ...filteredSales.expand((area) {
        List<Widget> cells = [];

        final areaValue = getQuantityValue(
          area.quantity,
          quantityType,
          quantityMatrial,
        );

        cells.add(
          buildCell(
            width: width??100,
            NumberFormat.decimalPatternDigits(decimalDigits: 0)
                .format(areaValue),
            color: const Color(0xfffff1df),
          ),
        );


        

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
