import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/table_column.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalColumn(
            values: ['1', '2', '3'],
            lableName: 'Month',
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DataTable(
                    columnSpacing: 20,
                    headingRowHeight: 45,
                    dataRowMinHeight: 38,
                    dataRowMaxHeight: 42,
                    headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: ['Bags', 'Bulk', 'Export', 'Clincker']
                        .map((c) => DataColumn(
                            label: Text(c,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14))))
                        .toList(),
                    rows: [
                      ['123', '456', '789', '101'],
                      ['123', '456', '789', '101'],
                      ['123', '456', '789', '101'],
                    ]
                        .map((row) => DataRow(
                              cells: row
                                  .map((cell) => DataCell(
                                      Center(child: Text(cell.toString()))))
                                  .toList(),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
