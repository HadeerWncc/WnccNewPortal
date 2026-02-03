import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/entities/customer_dispatch_entity.dart';

class CustomerDispatchTable extends StatelessWidget {
  const CustomerDispatchTable(
      {super.key, required this.customerDispatchResponse});
  final List<CustomerDispatchEntity> customerDispatchResponse;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalColumn(
            values: customerDispatchResponse.map((e) => e.date ?? "").toList(),
            lableName: 'Date',
            cellWidth: 110,
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
                    columns: const [
                      DataColumn(
                        label: Text(
                          'ElMasry',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Wadi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      customerDispatchResponse.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index].masry ?? 0),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index].wadi ?? 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  totalColumn(
                    values: customerDispatchResponse
                        .map((e) =>
                            NumberFormat.decimalPattern().format(e.bags ?? 0))
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
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Bulk',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      customerDispatchResponse.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index].bulk ?? 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  totalColumn(
                    values: customerDispatchResponse
                        .map((e) =>
                            NumberFormat.decimalPattern().format(e.total ?? 0))
                        .toList(),
                    lableName: 'Total',
                  ),
                  DataTable(
                    columnSpacing: 20,
                    headingRowHeight: 45,
                    dataRowMinHeight: 38,
                    dataRowMaxHeight: 42,
                    headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Export',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ExpTrading',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      customerDispatchResponse.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index].export ??
                                        0),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index]
                                            .expTrading ??
                                        0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  totalColumn(
                    values: customerDispatchResponse
                        .map((e) => NumberFormat.decimalPattern()
                            .format(e.totalExport ?? 0))
                        .toList(),
                    lableName: 'TotalExp',
                  ),
                  totalColumn(
                    values: customerDispatchResponse
                        .map((e) => NumberFormat.decimalPattern()
                            .format(e.alltotal ?? 0))
                        .toList(),
                    lableName: 'Total',
                  ),
                  DataTable(
                    columnSpacing: 20,
                    headingRowHeight: 45,
                    dataRowMinHeight: 38,
                    dataRowMaxHeight: 42,
                    headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Extra',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Clinker',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      customerDispatchResponse.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index].extra ?? 0),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                NumberFormat.decimalPattern().format(
                                    customerDispatchResponse[index].clincker ??
                                        0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
