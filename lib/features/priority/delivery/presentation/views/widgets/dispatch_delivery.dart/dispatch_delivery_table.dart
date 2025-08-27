import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/dispatched_delivery_order.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_dispatch_delivery_actions.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class DispatchDeliveryTable extends StatefulWidget {
  const DispatchDeliveryTable(
      {super.key,
      required this.onSelectOrders,
      required this.dispatchedOrders});
  final Function(List<String> ordersId) onSelectOrders;
  final List<DispatchedDeliveryOrder> dispatchedOrders;

  @override
  State<DispatchDeliveryTable> createState() => _DispatchDeliveryTableState();
}

class _DispatchDeliveryTableState extends State<DispatchDeliveryTable> {
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
          minWidth: 1400,
          showCheckboxColumn: true,
          dataRowHeight: 60,
          border: const TableBorder.symmetric(
              outside: BorderSide(color: Color.fromARGB(255, 195, 193, 193))),
          headingRowColor: WidgetStateProperty.all(
            const Color(0xffF9FAFC),
          ),
          columns: const [
            DataColumn(label: DataColumnText(text: 'Select')),
            DataColumn(label: DataColumnText(text: 'Product')),
            DataColumn(label: DataColumnText(text: 'Payer')),
            DataColumn(label: DataColumnText(text: 'Pod')),
            DataColumn(label: DataColumnText(text: 'PodAddress')),
            DataColumn(label: DataColumnText(text: 'Sales')),
            DataColumn(label: DataColumnText(text: 'Quantity')),
            DataColumn(label: DataColumnText(text: 'Dispatched At')),
            DataColumn(label: DataColumnText(text: 'Truck No')),
            DataColumn(label: DataColumnText(text: 'Status')),
            DataColumn(label: DataColumnText(text: 'Actions')),
          ],
          rows: List<DataRow>.generate(
            widget.dispatchedOrders.length,
            (index) {
              final color = index.isOdd
                  ? const Color(0xffF8F8FA)
                  : const Color(0xffFFFFFF);
              final item = widget.dispatchedOrders[index];
              return DataRow(color: WidgetStateProperty.all(color), cells: [
                DataCell(
                  CustomDataCellCheckbox(
                    orderId: item.id!,
                    onChanged: (value) {
                      //save orderId
                      if (value != null) {
                        orders.add(value);
                        setState(() {});
                      } else {
                        orders.removeWhere((element) => element == item.id!);
                        setState(() {});
                      }
                      widget.onSelectOrders(orders);
                    },
                  ),
                ),
                DataCell(CustomDataCellWidget(
                  title: item.productName ?? "",
                  subTitle: "category: ${item.productCategory}",
                )),
                DataCell(CustomDataCellWidget(
                    title: item.payerName ?? "",
                    subTitle: "Code: ${item.payerId}")),
                DataCell(CustomDataCellWidget(
                    title: item.podName ?? "",
                    subTitle: "Phone: ${item.podPhone}")),
                DataCell(CustomDataCellWidget(
                    title: item.podCity ?? "",
                    subTitle: "address: ${item.podAddress}")),
                DataCell(CustomDataCellWidget(
                    title: item.salesName, subTitle: "Code: ${item.salesId}")),
                DataCell(CustomDataCellWidget(
                    title: item.quantity.toString(),
                    subTitle: "Price: ${item.price}")),
                DataCell(CustomDataCellWidget(
                    title: DateFormat('MMMM d, y')
                        .format(item.dispatchDate ?? DateTime.now()),
                    subTitle: "Time: 12:00 PM")),
                DataCell(Center(child: Text(item.truckNo.toString()))),
                const DataCell(
                  Center(
                    child: CustomMarkedColorContainer(
                      title: 'CheckIn',
                      color: Colors.green,
                      bgColor: Color(0xffD9FDE3),
                    ),
                  ),
                ),
                DataCell(
                  CustomDispatchDeliveryActions(
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
