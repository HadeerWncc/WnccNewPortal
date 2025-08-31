import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_order.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/custom_priority_delivery_action.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/get_agent_bloc_builder.dart';

class PriorityDeliveryTable extends StatefulWidget {
  const PriorityDeliveryTable(
      {super.key, required this.onSelectOrders, required this.priorityOrders});
  final Function(List<DispatchDeliveryEntity> selectedOrders) onSelectOrders;
  final List<PriorityDeliveryOrder> priorityOrders;

  @override
  State<PriorityDeliveryTable> createState() => _PriorityDeliveryTableState();
}

class _PriorityDeliveryTableState extends State<PriorityDeliveryTable> {
  List<DispatchDeliveryEntity> orders = [];

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
            const Color(0xffF9FAFC),
          ),
          columns: const [
            DataColumn(label: DataColumnText(text: 'Select')),
            DataColumn(label: DataColumnText(text: 'OrderNo')),
            DataColumn(label: DataColumnText(text: 'Agent')),
            DataColumn(label: DataColumnText(text: 'Product')),
            DataColumn(label: DataColumnText(text: 'Payer')),
            DataColumn(label: DataColumnText(text: 'Pod')),
            DataColumn(label: DataColumnText(text: 'PodAddress')),
            DataColumn(label: DataColumnText(text: 'Sales')),
            DataColumn(label: DataColumnText(text: 'Quantity')),
            DataColumn(label: DataColumnText(text: 'Priorited At')),
            DataColumn(label: DataColumnText(text: 'Truck No')),
            DataColumn(label: DataColumnText(text: 'Actions')),
          ],
          rows: List<DataRow>.generate(
            widget.priorityOrders.length,
            (index) {
              final color = index.isOdd
                  ? const Color(0xffF8F8FA)
                  : const Color(0xffFFFFFF);
              final item = widget.priorityOrders[index];
              String agentName = "";

              return DataRow(color: WidgetStateProperty.all(color), cells: [
                DataCell(
                  CustomDataCellCheckbox(
                    orderId: item.id!,
                    onChanged: (value) {
                      if (value == true) {
                        orders.add(DispatchDeliveryEntity(
                          id: item.id!,
                          agentName: agentName,
                        ));
                        setState(() {});
                      } else {
                        orders.removeWhere((element) => element.id == item.id);
                        setState(() {});
                      }
                      widget.onSelectOrders(orders);
                    },
                  ),
                ),
                DataCell(
                  GetAgentBlocBuilder(
                    onChange: (agent) {
                      agentName = agent ?? "";
                      if (orders.where((o) => o.id == item.id).isNotEmpty) {
                        //To modify agent name
                        orders.removeWhere((element) => element.id == item.id);
                        orders.add(
                          DispatchDeliveryEntity(
                            id: item.id!,
                            agentName: agentName,
                          ),
                        );
                        widget.onSelectOrders(orders);
                      }
                    },
                  ),
                ),
                DataCell(Center(child: Text(item.id.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),),),
                DataCell(CustomDataCellWidget(
                    title: item.productName ?? "",
                    subTitle: "category: ${item.productCategory}")),
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
                    title: item.salesName ?? "",
                    subTitle: "Code: ${item.salesId}")),
                DataCell(CustomDataCellWidget(
                    title: item.quantity.toString(),
                    subTitle: "Price: ${item.price}")),
                DataCell(CustomDataCellWidget(
                    title: DateFormat('MMMM d, y')
                        .format(item.priorityDate ?? DateTime.now()),
                    subTitle: "Time: 12:00 PM")),
                DataCell(Center(child: Text(item.truckNo.toString()))),
                DataCell(
                  CustomPriorityDeliveryAction(
                    orderId: item.id!,
                    dispatchDeliveryEntity: DispatchDeliveryEntity(
                        id: item.id!, agentName: agentName),
                    onTap: () async {
                      //Add order to priority
                      // selectAgent(
                      //   context,
                      //   [dispatchDeliveryEntity],
                      // );
                      if (agentName == "") {
                        ShowSnackbar.showSnackBar(
                            context, "Please Select Agent!", 'W');
                      } else {
                        await BlocProvider.of<DispatchDeliveryOrderCubit>(
                                context)
                            .dispatchDeliveryOrders([
                          DispatchDeliveryEntity(
                            id: item.id!,
                            agentName: agentName,
                          ),
                        ]);
                      }
                    },
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
