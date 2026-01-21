import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/custom_pending_delivery_actions.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class PendingDeliveryTable extends StatefulWidget {
  const PendingDeliveryTable(
      {super.key, required this.onSelectOrders, required this.pendingOrders});
  final Function(List<String> ordersId) onSelectOrders;
  final List<OrderResponse> pendingOrders;

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
          minWidth: 1800,
          showCheckboxColumn: true,
          dataRowHeight: 60,
          border: const TableBorder.symmetric(
              outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
          headingRowColor: WidgetStateProperty.all(
            const Color.fromARGB(255, 235, 234, 234),
          ),
          // headingTextStyle: const TextStyle(
          //   color: Colors.white,
          //   fontWeight: FontWeight.bold,
          // ),
          columns: const [
            DataColumn(label: DataColumnText(text: 'Select')),
            DataColumn(label: DataColumnText(text: 'OrderNo')),
            DataColumn(label: DataColumnText(text: 'Product')),
            DataColumn(label: DataColumnText(text: 'Payer')),
            DataColumn(label: DataColumnText(text: 'Pod')),
            DataColumn(label: DataColumnText(text: 'PodAddress')),
            DataColumn(label: DataColumnText(text: 'Sales')),
            DataColumn(label: DataColumnText(text: 'Quantity')),
            DataColumn(label: DataColumnText(text: 'Registered At')),
            DataColumn(label: DataColumnText(text: 'Actions')),
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
                    orderId: item.id!,
                    onChanged: (value) {
                      //save orderId
                      if (value == true) {
                        orders.add(item.id!);
                        setState(() {});
                      } else {
                        orders.removeWhere((element) => element == item.id!);
                        setState(() {});
                      }
                      widget.onSelectOrders(orders);
                    },
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.id.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(CustomDataCellWidget(
                    title: item.product?.name ?? "",
                    subTitle: "category: ${item.product?.category}")),
                DataCell(CustomDataCellWidget(
                    title: item.payer?.fullName ?? "",
                    subTitle: "Code: ${item.payer?.id}")),
                DataCell(CustomDataCellWidget(
                    title: item.podName ?? "",
                    subTitle: "Phone: ${item.podPhone}")),
                DataCell(CustomDataCellWidget(
                    title: item.podCity ?? "",
                    subTitle: "address: ${item.podAddress}")),
                DataCell(CustomDataCellWidget(
                    title: item.sales?.fullName ?? "",
                    subTitle: "Code: ${item.sales?.id}")),
                DataCell(CustomDataCellWidget(
                    title: item.quantity.toString(),
                    subTitle: "Price: ${item.price}")),
                DataCell(CustomDataCellWidget(
                    title: DateFormat('MMM d, y')
                        .format(item.registerDate ?? DateTime.now()),
                    subTitle: "Time: 12:00 PM")),
                DataCell(
                  CustomPendingDeliveryActions(
                    orderId: item.id!,
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
