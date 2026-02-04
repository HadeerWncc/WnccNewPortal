import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/capitalize.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';

Widget buildCustomerTable({
  required List<FactVsCustDispModel> customerDispatchResponse,
  required String lableName,
}) {
  if (customerDispatchResponse.isEmpty) return const SizedBox();

  final firstRow =
      customerDispatchResponse.first.customerDispatchResponse.toJson();
  List<String> allKeys = firstRow.keys.toList();

  int totalIndex = allKeys.indexOf('total');
  int bagsIndex = allKeys.indexOf('bags');
  int totalExportIndex = allKeys.indexOf('t_Export');
  // int finalTotalIndex = allKeys.indexOf('final_Total');
  final bool showTotalRow = lableName != 'Time';

  List<List<dynamic>> data = customerDispatchResponse.map((model) {
    final json = model.customerDispatchResponse.toJson();
    return allKeys.map((k) => json[k] ?? 0).toList();
  }).toList();

  if (showTotalRow) {
    final totals = List.generate(allKeys.length, (colIndex) {
      return data.fold<num>(
        0,
        (sum, row) => sum + (row[colIndex] as num),
      );
    });
    data.add(totals);
  }
  List<String> labels = customerDispatchResponse
      .map((e) => e.day != 0 ? e.day.toString() : e.displayDate.toString())
      .toList();

  if (showTotalRow) {
    labels.add('Total');
  }

  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        totalColumn(
          values: labels,
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
                  columns: allKeys
                      .sublist(0, bagsIndex)
                      .map(
                        (key) => DataColumn(
                          label: Text(
                            key.capitalize(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                  rows: data.map((row) {
                    return DataRow(
                      cells: row
                          .sublist(0, bagsIndex)
                          .map((cell) => DataCell(
                                Center(child: Text(NumberFormat.decimalPattern()
                                  .format(cell ?? 0))),
                              ))
                          .toList(),
                    );
                  }).toList(),
                ),
                totalColumn(
                  values: data.map((row) => NumberFormat.decimalPattern()
                                  .format(row[bagsIndex] ?? 0)).toList(),
                  lableName: 'Bags',
                ),
                DataTable(
                  columnSpacing: 20,
                  headingRowHeight: 45,
                  dataRowMinHeight: 38,
                  dataRowMaxHeight: 42,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: allKeys
                      .sublist(bagsIndex + 1, totalIndex)
                      .map(
                        (key) => DataColumn(
                          label: Center(
                            child: Text(
                              key.capitalize(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  rows: data.map((row) {
                    return DataRow(
                      cells: row
                          .sublist(bagsIndex + 1, totalIndex)
                          .map((cell) => DataCell(
                                Center(child: Text(NumberFormat.decimalPattern()
                                  .format(cell ?? 0))),
                              ))
                          .toList(),
                    );
                  }).toList(),
                ),
                totalColumn(
                  values:
                      data.map((row) => NumberFormat.decimalPattern()
                                  .format(row[totalIndex] ?? 0)).toList(),
                  lableName: 'Total',
                ),
                DataTable(
                  columnSpacing: 20,
                  headingRowHeight: 45,
                  dataRowMinHeight: 38,
                  dataRowMaxHeight: 42,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: allKeys
                      .sublist(totalIndex + 1, totalExportIndex)
                      .map(
                        (key) => DataColumn(
                          label: Center(
                            child: Text(
                              key.capitalize(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  rows: data.map((row) {
                    return DataRow(
                      cells: row
                          .sublist(totalIndex + 1, totalExportIndex)
                          .map((cell) => DataCell(
                                Center(child: Text(NumberFormat.decimalPattern()
                                  .format(cell ?? 0))),
                              ))
                          .toList(),
                    );
                  }).toList(),
                ),
                totalColumn(
                  values: data
                      .map((row) => NumberFormat.decimalPattern()
                                  .format(row[totalExportIndex] ?? 0))
                      .toList(),
                  lableName: 'T_Export',
                ),
                totalColumn(
                  values: data
                      .map((row) => NumberFormat.decimalPattern()
                                  .format((row[totalExportIndex] ?? 0) + (row[totalIndex] ?? 0)))
                      .toList(),
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
