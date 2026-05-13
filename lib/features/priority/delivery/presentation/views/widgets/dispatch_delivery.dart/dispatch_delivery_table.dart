import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/custom_dispatch_delivery_actions.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class DispatchDeliveryTable extends StatefulWidget {
  const DispatchDeliveryTable(
      {super.key,
      required this.onSelectOrders,
      required this.dispatchedOrders,
      required this.user});
  final Function(List<String> ordersId) onSelectOrders;
  final List<PriorityDeliveryModel> dispatchedOrders;
  final UserModel user;

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
          minWidth: 1900,
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
            DataColumn2(
                label: DataColumnText(text: 'Dispatcher'), fixedWidth: 160),
            DataColumn2(
                label: DataColumnText(text: 'Priorited At'), fixedWidth: 140),
            DataColumn2(
                label: DataColumnText(text: 'Dispatched At'), fixedWidth: 140),
            DataColumn2(label: DataColumnText(text: 'Code'), fixedWidth: 100),
            DataColumn(label: DataColumnText(text: 'Customer')),
            DataColumn2(label: DataColumnText(text: 'No'), fixedWidth: 100),
            DataColumn(label: DataColumnText(text: 'Matrial')),
            DataColumn2(label: DataColumnText(text: 'Qty'), fixedWidth: 120),
            DataColumn2(label: DataColumnText(text: 'Zone'), fixedWidth: 120),
            DataColumn2(
                label: DataColumnText(text: 'Receiver'), fixedWidth: 140),
            DataColumn2(label: DataColumnText(text: 'Truck'), fixedWidth: 60),
            DataColumn2(
                label: DataColumnText(text: 'Ship.Status'), fixedWidth: 150),
            DataColumn2(label: DataColumnText(text: 'Sales'), fixedWidth: 150),
            DataColumn2(label: DataColumnText(text: 'Actions'), fixedWidth: 80),
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
                      item.dispatcher.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      DateFormat('d/M/yyyy')
                          .format(DateTime.parse(item.priorityDate)),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      DateFormat('d/M/yyyy')
                          .format(DateTime.parse(item.dispatchDate)),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.customerId.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.customerName.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.delivery.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      item.materialDescription.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      formatNum(item.deliveryQuantity ?? 0),
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
                      item.truckNo.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                      child: CustomMarkedColorContainer(
                    bgColor: item.shipmentStatus == 'No Shipment'?  const Color.fromARGB(255, 225, 225, 225) : const Color.fromARGB(255, 211, 252, 212),
                    color: const Color.fromARGB(255, 63, 63, 63),
                    title: item.shipmentStatus.toString(),
                  )),
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
                  CustomDispatchDeliveryActions(
                    orderId: item.delivery!,
                    user: widget.user,
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
