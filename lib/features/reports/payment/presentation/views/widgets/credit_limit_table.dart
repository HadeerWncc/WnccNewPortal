import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/payment/data/models/credit_limit/credit_limit/credit_limit.dart';

class CreditLimitTable extends StatefulWidget {
  const CreditLimitTable({super.key, required this.tableData});
  final List<CreditLimit> tableData;

  @override
  State<CreditLimitTable> createState() => _CreditLimitTableState();
}

class _CreditLimitTableState extends State<CreditLimitTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.tableData.isEmpty
            ? const Center(
                child: Text('No Data Available'),
              )
            : Expanded(
                child: DataTable2(
                  minWidth: widget.tableData.first.toMap().length * 120,
                  isVerticalScrollBarVisible: false,
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  fixedTopRows: 1,
                  fixedLeftColumns: 1,
                  fixedColumnsColor: tableHeaderColor,
                  headingRowHeight: 45,
                  headingRowColor: WidgetStateProperty.all(tableHeaderColor),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: widget.tableData.first
                      .toMap()
                      .keys
                      .toList()
                      .map(
                        (e) => (e == "Customer")
                            ? DataColumn2(
                                fixedWidth: 230,
                                label: Center(
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : (e == "Sales")
                                ? DataColumn2(
                                    fixedWidth: 140,
                                    label: Center(
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : DataColumn(
                                    label: Center(
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                      )
                      .toList(),
                  rows: widget.tableData.map(
                    (payment) {
                      final paymentMap = payment.toMap();
                      return DataRow(
                        cells: paymentMap.values.map(
                          (value) {
                            return DataCell(
                              Center(
                                child: Text(value.toString()),
                              ),
                            );
                          },
                        ).toList(),
                      );
                    },
                  ).toList(),
                ),
              ),
      ],
    );
  }
}
