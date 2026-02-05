import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/table_column.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/entities/factory_entity.dart';

class FactoryDispatchTable extends StatelessWidget {
  const FactoryDispatchTable({super.key, this.factoryDispatchResponse});
  final List<FactoryEntity>? factoryDispatchResponse;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalColumn(
            values:
                factoryDispatchResponse?.map((e) => e.date ?? "").toList() ??
                    [],
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
                    rows: List<DataRow>.generate(
                      factoryDispatchResponse?.length ?? 0,
                      (index) {
                        final item = factoryDispatchResponse![index];
                        return DataRow(
                          color: (index == factoryDispatchResponse!.length - 1)
                              ? WidgetStateProperty.all(tableHeaderColor)
                              : null,
                          cells: [
                            DataCell(
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(item.bags ?? 0),
                                style: TextStyle(
                                    fontWeight: (index ==
                                            factoryDispatchResponse!.length - 1)
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ),
                            DataCell(
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(item.bulk ?? 0),
                                style: TextStyle(
                                    fontWeight: (index ==
                                            factoryDispatchResponse!.length - 1)
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ),
                            DataCell(
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(item.export ?? 0),
                                style: TextStyle(
                                    fontWeight: (index ==
                                            factoryDispatchResponse!.length - 1)
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ),
                            DataCell(
                              Text(
                                NumberFormat.decimalPattern()
                                    .format(item.total ?? 0),
                                style: TextStyle(
                                    fontWeight: (index ==
                                            factoryDispatchResponse!.length - 1)
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ),
                          ],
                        );
                      },
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
