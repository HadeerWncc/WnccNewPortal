import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';

class LoadingFactTable extends StatelessWidget {
  const LoadingFactTable({super.key, required this.lableName});
  final String lableName;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalColumn(
            values: [lableName, lableName, lableName, lableName, lableName],
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
                    columns: [
                      DataColumn(
                        label: Container(
                          width: 60,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 60,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 60,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 60,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 60,
                          height: 20,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                          DataCell(Container(
                            width: 60,
                            height: 20,
                            color: Colors.grey.shade300,
                          )),
                        ],
                      ),
                    ],
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
