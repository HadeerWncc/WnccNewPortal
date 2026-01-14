import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/capitalize.dart';
import 'package:wncc_portal/features/factVsCustDisp/data/models/fact_vs_cust_disp_model/fact_vs_cust_disp_model.dart';
import 'package:wncc_portal/features/factVsCustDisp/presentation/views/widgets/table_column.dart';

Widget buildCustomerTable({
  required List<FactVsCustDispModel> customerDispatchResponse,
  required String lableName,
}) {
  if (customerDispatchResponse.isEmpty) return const SizedBox();

  final firstRow =
      customerDispatchResponse.first.customerDispatchResponse.toJson();
  List<String> allKeys = firstRow.keys.toList();

  int totalIndex = allKeys.indexOf('total');

  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        totalColumn(
          values:
              customerDispatchResponse.map((e) => e.day!=null ? e.day.toString() : e.displayDate.toString()).toList(),
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
                      .sublist(0, totalIndex)
                      .map(
                        (key) => DataColumn(
                          label: Text(
                            key.capitalize(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                  rows: customerDispatchResponse.map((model) {
                    final data = model.customerDispatchResponse.toJson();
                    return DataRow(
                      cells: allKeys
                          .sublist(0, totalIndex)
                          .map((key) => DataCell(
                              Center(child: Text(data[key].toString()))))
                          .toList(),
                    );
                  }).toList(),
                ),
                totalColumn(
                  values: customerDispatchResponse
                      .map((e) => e.customerDispatchResponse.total.toString())
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
                  columns: allKeys
                      .sublist(totalIndex + 1)
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
                  rows: customerDispatchResponse.map((model) {
                    final data = model.customerDispatchResponse.toJson();
                    return DataRow(
                      cells: allKeys
                          .sublist(totalIndex + 1)
                          .map((key) => DataCell(
                              Center(child: Text(data[key].toString()))))
                          .toList(),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
