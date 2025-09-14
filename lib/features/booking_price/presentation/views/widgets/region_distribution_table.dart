import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/custom_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class RegionDistributionTable extends StatelessWidget {
  const RegionDistributionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .4,
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
        // const TableBorder.symmetric(

        //     outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
        // headingRowColor: WidgetStateProperty.all(
        //   const Color(0xffF9FAFC),
        // ),
        columns: const [
          DataColumn(label: DataColumnText(text: 'Region')),
          DataColumn(label: DataColumnText(text: 'Area')),
          DataColumn(label: DataColumnText(text: 'Delivery')),
          DataColumn(label: DataColumnText(text: 'Pickup')),
          DataColumn(label: DataColumnText(text: 'Remeber')),
        ],
        rows: List<DataRow>.generate(
          5,
          (index) {
            // final item = widget.pendingOrders[index];
            return DataRow(cells: [
              DataCell(
                Center(
                  child: Text(
                    "Alexendaria",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              DataCell(
                Center(
                  child: Text(
                    'Delta Egypt',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              DataCell(
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomInput(),
                  ),
                ),
              ),
              DataCell(
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomInput(),
                )),
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
    );
  }
}
