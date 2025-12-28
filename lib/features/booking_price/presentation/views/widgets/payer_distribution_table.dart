import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/custom_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class PayerDistributionTable extends StatelessWidget {
  const PayerDistributionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .25,
        child: DataTable2(
          columnSpacing: 0,
          horizontalMargin: 0,
          minWidth: 600,
          showCheckboxColumn: true,
          dataRowHeight: 60,
          headingRowColor: const WidgetStatePropertyAll(Color(0xffF9F9F9)),
          border: TableBorder(
            verticalInside: tableBorderSide(),
            top: tableBorderSide(),
            bottom: tableBorderSide(),
            left: tableBorderSide(),
            right: tableBorderSide(),
          ),
          columns: const [
            DataColumn(label: DataColumnText(text: 'Payer')),
            DataColumn(label: DataColumnText(text: 'Code')),
            DataColumn(label: DataColumnText(text: 'Delivery')),
            DataColumn(label: DataColumnText(text: 'Pickup')),
            DataColumn(label: DataColumnText(text: 'Remeber')),
          ],
          rows: List<DataRow>.generate(
            2,
            (index) {
              return DataRow(cells: [
                const DataCell(
                  Center(
                    child: Text(
                      "Mohammed Kmal",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const DataCell(
                  Center(
                    child: Text(
                      '1000049',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const DataCell(
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomInput(),
                    ),
                  ),
                ),
                const DataCell(
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomInput(),
                    ),
                  ),
                ),
                DataCell(
                  CustomDataCellCheckbox(
                    orderId: '5',
                    onChanged: (value) {},
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
