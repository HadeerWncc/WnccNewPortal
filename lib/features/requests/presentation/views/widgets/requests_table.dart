import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_state_container.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/custom_pending_delivery_actions.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/custom_request_actions.dart';

class RequestsTable extends StatelessWidget {
  const RequestsTable({
    super.key,
  });

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
                outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
            headingRowColor: WidgetStateProperty.all(
              const Color(0xffF9FAFC),
            ),
            columns: const [
              DataColumn(label: DataColumnText(text: 'ID')),
              DataColumn(label: DataColumnText(text: 'Payer')),
              DataColumn(label: DataColumnText(text: 'Level')),
              DataColumn(label: DataColumnText(text: 'Status')),
              DataColumn(label: DataColumnText(text: 'No')),
              DataColumn(label: DataColumnText(text: 'Created At')),
              DataColumn(label: DataColumnText(text: 'Actions')),
            ],
            rows: List<DataRow>.generate(
              10,
              (index) {
                final color = index.isOdd
                    ? const Color(0xffF8F8FA)
                    : const Color(0xffFFFFFF);
                return DataRow(
                  onSelectChanged: (value){
                    print(value);
                  },
                  // onLongPress: (){
                  //   print('Hello');
                  // },
                  color: WidgetStateProperty.all(color),
                  cells: [
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          //Go To Details
                        },
                        child: Center(
                            child: Text(
                          '12908',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    DataCell(
                      CustomDataCellWidget(
                          title: "Ahmed Ali", subTitle: "1000049"),
                    ),
                    DataCell(
                      Center(
                        child: CustomStateContainer(
                          title: 'Critical',
                          color: Color.fromARGB(255, 18, 159, 22),
                          bgColor: Color(0xffD9FDE3),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: CustomStateContainer(
                          title: 'New',
                          color: Color.fromARGB(255, 0, 139, 253),
                          bgColor: Color.fromARGB(255, 223, 236, 248),
                        ),
                      ),
                    ),
                    DataCell(Center(
                        child: Text(
                      '145236',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
                    DataCell(CustomDataCellWidget(
                        title: "Apr 20 2025", subTitle: "time: 12:30}")),
                    DataCell(
                      CustomRequestActions(
                        requestId: '14',
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
