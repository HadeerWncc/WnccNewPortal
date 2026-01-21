import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/capitalize.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/table_column.dart';

Widget buildFactoryTable({
  required List<FactVsCustDispModel> factoryDispatchResponse,
  required String lableName,
}) {
  if (factoryDispatchResponse.isEmpty) return const SizedBox();

  final firstRowResponse =
      factoryDispatchResponse.first.factoryDispatchResponse;

  List<String> columns = [
    ...firstRowResponse.toJson().keys.where((key) => key != 'total'),
    'Total',
  ];
  int bagsIndex = columns.indexOf('bags');
  int totalBulkIndex = columns.indexOf('t.Bulk');
  int totalIndex = columns.indexOf('Total');

  List<List<dynamic>> data = factoryDispatchResponse.map((model) {
    final factoryData = model.factoryDispatchResponse.toJson();
    List<dynamic> row = [];
    for (var key in columns) {
      if (key != 'Total') {
        row.add(factoryData[key] ?? 0);
      }
    }
    row.add(model.factoryDispatchResponse.total ?? 0);
    return row;
  }).toList();

  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        totalColumn(
          values: factoryDispatchResponse
              .map((e) =>
                  e.day != 0 ? e.day.toString() : e.displayDate.toString())
              .toList(),
          lableName: lableName,
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
                  columns: columns
                      .sublist(0, bagsIndex)
                      .map((c) => DataColumn(
                          label: Text(c.capitalize(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))))
                      .toList(),
                  rows: data
                      .map((row) => DataRow(
                            cells: row
                                .sublist(0, bagsIndex)
                                .map((cell) => DataCell(
                                    Center(child: Text(cell.toString()))))
                                .toList(),
                          ))
                      .toList(),
                ),
                totalColumn(
                  values: factoryDispatchResponse
                      .map((e) => e.factoryDispatchResponse.bags.toString())
                      .toList(),
                  lableName: 'Bags',
                ),
                DataTable(
                  columnSpacing: 20,
                  headingRowHeight: 45,
                  dataRowMinHeight: 38,
                  dataRowMaxHeight: 42,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: columns
                      .sublist(bagsIndex + 1, totalBulkIndex)
                      .map((c) => DataColumn(
                          label: Text(c.capitalize(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))))
                      .toList(),
                  rows: data
                      .map((row) => DataRow(
                            cells: row
                                .sublist(bagsIndex + 1, totalBulkIndex)
                                .map((cell) => DataCell(
                                    Center(child: Text(cell.toString()))))
                                .toList(),
                          ))
                      .toList(),
                ),
                totalColumn(
                  values: factoryDispatchResponse
                      .map((e) => e.factoryDispatchResponse.tBulk.toString())
                      .toList(),
                  lableName: 'T_Bulk',
                ),
                DataTable(
                  columnSpacing: 20,
                  headingRowHeight: 45,
                  dataRowMinHeight: 38,
                  dataRowMaxHeight: 42,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: columns
                      .sublist(totalBulkIndex + 1,totalIndex)
                      .map((c) => DataColumn(
                          label: Text(c.capitalize(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))))
                      .toList(),
                  rows: data
                      .map((row) => DataRow(
                            cells: row
                                .sublist(totalBulkIndex + 1,totalIndex)
                                .map((cell) => DataCell(
                                    Center(child: Text(cell.toString()))))
                                .toList(),
                          ))
                      .toList(),
                ),
                totalColumn(
                  values: data.map((e) => e.last.toString()).toList(),
                  lableName: 'Total',
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
