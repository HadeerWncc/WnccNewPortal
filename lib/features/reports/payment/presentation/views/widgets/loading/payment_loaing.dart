import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/constants/colors.dart';

class PaymentLoaing extends StatelessWidget {
  const PaymentLoaing({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: DataTable(
          headingRowHeight: 45,
          dataRowMinHeight: 38,
          dataRowMaxHeight: 42,
          headingRowColor: WidgetStateProperty.all(tableHeaderColor),
          border: TableBorder.all(color: Colors.grey.shade300),
          columns: ["Date", "AAIB", "CIB", "QNB", "Total"]
              .map(
                (e) => DataColumn(
                  label: Center(
                    child: Text(
                      e,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              .toList(),
          rows: [
            DataRow(cells: [
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              )
            ]),
            DataRow(cells: [
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              )
            ]),
            DataRow(cells: [
              DataCell(
                Text("Total"),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              ),
              DataCell(
                Text(""),
              )
            ]),
          ]),
    );
  }
}
