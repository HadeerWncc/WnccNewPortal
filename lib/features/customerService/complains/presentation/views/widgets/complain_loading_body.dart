import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/customerService/core/widgets/complain_loading_cell.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class ComplainLoadingBody extends StatelessWidget {
  const ComplainLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width < 800
              ? 800
              : MediaQuery.of(context).size.width,
          child: DataTable2(
            showCheckboxColumn: false,
            columnSpacing: 0,
            horizontalMargin: 0,
            minWidth: 800,
            dataRowHeight: 60,
            border: const TableBorder.symmetric(
                outside:
                    BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
            headingRowColor: WidgetStateProperty.all(
              const Color(0xffF9FAFC),
            ),
            columns: const [
              DataColumn(label: DataColumnText(text: 'ID')),
              DataColumn(label: DataColumnText(text: 'Payer')),
              DataColumn(label: DataColumnText(text: 'Subject')),
              DataColumn(label: DataColumnText(text: 'Actions')),
            ],
            rows: List<DataRow>.generate(
              3,
              (index) {
                final color = index.isOdd
                    ? const Color(0xffF8F8FA)
                    : const Color(0xffFFFFFF);
                return DataRow(
                  color: WidgetStateProperty.all(color),
                  cells: const [
                    DataCell(
                      LoadingTableCell(width: 55),
                    ),
                    DataCell(
                      LoadingTableCell(width: 70),
                    ),
                    DataCell(
                      LoadingTableCell(width: 110),
                    ),
                    DataCell(
                      LoadingTableCell(width: 20),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}