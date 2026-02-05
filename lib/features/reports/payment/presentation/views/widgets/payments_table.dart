import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';

class PaymentsTable extends StatelessWidget {
  const PaymentsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalColumn(
            values:
            ['01 Jan 2024', '02 Jan 2024', '03 Jan 2024',],
            lableName: 'Date',
            cellWidth: 110,
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DataTable(
                    headingRowHeight: 45,
                    dataRowMinHeight: 38,
                    dataRowMaxHeight: 42,
                    headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Bags',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Bulk',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Export',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: const [
                      DataRow(
                        cells: [
                          DataCell(Text('100')),
                          DataCell(Text('200')),
                          DataCell(Text('150')),
                          DataCell(Text('450')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('120')),
                          DataCell(Text('220')),
                          DataCell(Text('180')),
                          DataCell(Text('520')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('130')),
                          DataCell(Text('210')),
                          DataCell(Text('170')),
                          DataCell(Text('510')),
                        ],
                      ),
                    ]
                    //  List<DataRow>.generate(
                    //   factoryDispatchResponse?.length ?? 0,
                    //   (index) {
                    //     final item = factoryDispatchResponse![index];
                    //     return DataRow(
                    //       color: (index == factoryDispatchResponse!.length - 1)
                    //           ? WidgetStateProperty.all(tableHeaderColor)
                    //           : null,
                    //       cells: [
                    //         DataCell(
                    //           Text(
                    //             NumberFormat.decimalPattern()
                    //                 .format(item.bags ?? 0),
                    //             style: TextStyle(
                    //                 fontWeight: (index ==
                    //                         factoryDispatchResponse!.length - 1)
                    //                     ? FontWeight.bold
                    //                     : FontWeight.normal),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text(
                    //             NumberFormat.decimalPattern()
                    //                 .format(item.bulk ?? 0),
                    //             style: TextStyle(
                    //                 fontWeight: (index ==
                    //                         factoryDispatchResponse!.length - 1)
                    //                     ? FontWeight.bold
                    //                     : FontWeight.normal),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text(
                    //             NumberFormat.decimalPattern()
                    //                 .format(item.export ?? 0),
                    //             style: TextStyle(
                    //                 fontWeight: (index ==
                    //                         factoryDispatchResponse!.length - 1)
                    //                     ? FontWeight.bold
                    //                     : FontWeight.normal),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text(
                    //             NumberFormat.decimalPattern()
                    //                 .format(item.total ?? 0),
                    //             style: TextStyle(
                    //                 fontWeight: (index ==
                    //                         factoryDispatchResponse!.length - 1)
                    //                     ? FontWeight.bold
                    //                     : FontWeight.normal),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                 
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