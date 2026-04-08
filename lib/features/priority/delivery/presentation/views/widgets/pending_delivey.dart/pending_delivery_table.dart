import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/custom_pending_delivery_actions.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class PendingDeliveryTable extends StatefulWidget {
  const PendingDeliveryTable(
      {super.key,
      required this.onSelectOrders,
      required this.pendingOrders,
      required this.priorityDate});
  final Function(List<String> ordersId) onSelectOrders;
  final List<PriorityDeliveryModel> pendingOrders;
  final DateTime priorityDate;
  @override
  State<PendingDeliveryTable> createState() => _PendingDeliveryTableState();
}

class _PendingDeliveryTableState extends State<PendingDeliveryTable> {
  List<String> orders = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .4,
        child: DataTable2(
          columnSpacing: 0,
          horizontalMargin: 0,
          minWidth: 1500,
          showCheckboxColumn: true,
          dataRowHeight: 60,
          border: const TableBorder.symmetric(
              outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
          headingRowColor: WidgetStateProperty.all(
            kBtnColor,
          ),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          columns: const [
            DataColumn2(label: DataColumnText(text: 'Select'), fixedWidth: 60),
            DataColumn2(label: DataColumnText(text: 'Code'), fixedWidth: 100),
            DataColumn(label: DataColumnText(text: 'Customer')),
            DataColumn2(label: DataColumnText(text: 'No'), fixedWidth: 120),
            DataColumn2(label: DataColumnText(text: 'Zone'), fixedWidth: 120),
            DataColumn2(
                label: DataColumnText(text: 'Receiver'), fixedWidth: 130),
            DataColumn2(label: DataColumnText(text: 'QTY'), fixedWidth: 100),
            DataColumn(label: DataColumnText(text: 'Matrial')),
            DataColumn2(
                label: DataColumnText(text: 'Registered At'), fixedWidth: 140),
            DataColumn2(label: DataColumnText(text: 'Sales'), fixedWidth: 150),
            DataColumn2(label: DataColumnText(text: 'Actions'), fixedWidth: 80),
          ],
          rows: List<DataRow>.generate(
            widget.pendingOrders.length,
            (index) {
              final color = index.isOdd
                  ? const Color(0xffF8F8FA)
                  : const Color(0xffFFFFFF);
              final item = widget.pendingOrders[index];
              return DataRow(color: WidgetStateProperty.all(color), cells: [
                DataCell(
                  CustomDataCellCheckbox(
                    orderId: item.delivery!,
                    onChanged: (value) {
                      //save orderId
                      if (value == true) {
                        orders.add(item.delivery!);
                        setState(() {});
                      } else {
                        orders.removeWhere(
                            (element) => element == item.delivery!);
                        setState(() {});
                      }
                      widget.onSelectOrders(orders);
                    },
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      int.parse(item.customerId ?? "").toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.customerName ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.delivery ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.addressTransZoneDesc.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.receiver.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.deliveryQuantity.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.materialName ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      DateFormat('d/M/yyyy').format(DateTime.parse(
                          item.registerDate ?? DateTime.now().toString())),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.salesName.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  CustomPendingDeliveryActions(
                    orderId: item.delivery!,
                    priorityDate: widget.priorityDate,
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
