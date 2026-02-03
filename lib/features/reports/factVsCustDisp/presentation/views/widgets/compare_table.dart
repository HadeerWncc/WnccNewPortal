import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/domain/entities/comparing_entity_item.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({super.key, required this.curerentYear});
  final List<ComparingEntityItem> curerentYear;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalColumn(
            values: [...curerentYear.map((e) => e.month.toString()),"Total"],
            lableName: 'Month',
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
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
                                  fontWeight: FontWeight.bold, fontSize: 14))))
                      .toList(),
                  rows: [
                    ...curerentYear.map((row) => DataRow(
                          cells: [
                            DataCell(Center(child: Text(row.bags.toString()))),
                            DataCell(Center(child: Text(row.bulk.toString()))),
                            DataCell(
                                Center(child: Text(row.export.toString()))),
                            DataCell(
                                Center(child: Text(row.clincker.toString()))),
                          ],
                        )),
                    DataRow(
                      color: WidgetStateProperty.all(
                          Colors.grey[200]), // تمييز الصف بلون مختلف
                      cells: [
                        DataCell(Center(
                            child: Text(
                                curerentYear
                                    .fold<num>(
                                        0, (sum, item) => sum + item.bags)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)))),
                        DataCell(Center(
                            child: Text(
                                curerentYear
                                    .fold<num>(
                                        0, (sum, item) => sum + item.bulk)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)))),
                        DataCell(Center(
                            child: Text(
                                curerentYear
                                    .fold<num>(
                                        0, (sum, item) => sum + item.export)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)))),
                        DataCell(Center(
                            child: Text(
                                curerentYear
                                    .fold<num>(
                                        0, (sum, item) => sum + item.clincker)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)))),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
