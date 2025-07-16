import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_state_container.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/custom_pending_delivery_actions.dart';

class ComplainTable extends StatelessWidget {
  const ComplainTable({super.key});

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
            columnSpacing: 0,
            horizontalMargin: 0,
            minWidth: 800,
            showCheckboxColumn: true,
            dataRowHeight: 60,
            border: const TableBorder.symmetric(
                outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
            headingRowColor: WidgetStateProperty.all(
              const Color(0xffF9FAFC),
            ),
            columns: const [
              DataColumn(label: DataColumnText(text: 'Payer')),
              DataColumn(label: DataColumnText(text: 'Subject')),
              DataColumn(label: DataColumnText(text: 'Status')),
              DataColumn(label: DataColumnText(text: 'Actions')),
            ],
            rows: List<DataRow>.generate(
              10,
              (index) {
                final color = index.isOdd
                    ? const Color(0xffF8F8FA)
                    : const Color(0xffFFFFFF);
                return DataRow(
                  color: WidgetStateProperty.all(color),
                  cells: const [
                    DataCell(CustomDataCellWidget(
                        title: "Ahmed Ali", subTitle: "1000049")),
                    DataCell(
                      Center(
                        child: Text(
                          'إلغاء الأوردرات',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: CustomStateContainer(
                          title: 'Created',
                          color: Color.fromARGB(255, 0, 139, 253),
                          bgColor: Color.fromARGB(255, 223, 236, 248),
                        ),
                      ),
                    ),
                    DataCell(
                      CustomPendingDeliveryActions(
                        orderId: '14',
                      ),
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
