import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/utils/methods/make_sure_dialog.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/delivery/data/models/priority_delivery_model/priority_delivery_model.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/custom_priority_delivery_action.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/get_agent_bloc_builder.dart';

class PriorityDeliveryTable extends StatefulWidget {
  const PriorityDeliveryTable(
      {super.key,
      required this.onSelectOrders,
      required this.priorityOrders,
      required this.user});
  final Function(List<DispatchDeliveryEntity> selectedOrders) onSelectOrders;
  final List<PriorityDeliveryModel> priorityOrders;
  final UserModel user;
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
          minWidth: 1600,
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
                label: DataColumnText(text: 'Dispatcher'), fixedWidth: 150),
            DataColumn2(
                label: DataColumnText(text: 'Priorited At'), fixedWidth: 140),
            DataColumn2(label: DataColumnText(text: 'Code'), fixedWidth: 100),
            DataColumn(label: DataColumnText(text: 'Customer')),
            DataColumn2(label: DataColumnText(text: 'No'), fixedWidth: 120),
            DataColumn(label: DataColumnText(text: 'Matrial')),
            DataColumn2(label: DataColumnText(text: 'Qty'), fixedWidth: 100),
            DataColumn2(label: DataColumnText(text: 'Zone'), fixedWidth: 120),
            DataColumn2(
                label: DataColumnText(text: 'Receiver'), fixedWidth: 130),
            DataColumn2(label: DataColumnText(text: 'Sales'), fixedWidth: 150),
            DataColumn2(label: DataColumnText(text: 'Truck'), fixedWidth: 60),
            DataColumn2(label: DataColumnText(text: 'Actions'), fixedWidth: 80),
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
                    orderId: item.delivery!,
                    onChanged: (value) {
                      if (value == true) {
                        orders.add(DispatchDeliveryEntity(
                          id: item.delivery!,
                          agentName: agentName,
                        ));
                        setState(() {});
                      } else {
                        orders.removeWhere(
                            (element) => element.id == item.delivery);
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
                      if (orders
                          .where((o) => o.id == item.delivery)
                          .isNotEmpty) {
                        //To modify agent name
                        orders.removeWhere(
                            (element) => element.id == item.delivery);
                        orders.add(
                          DispatchDeliveryEntity(
                            id: item.delivery!,
                            agentName: agentName,
                          ),
                        );
                        widget.onSelectOrders(orders);
                      }
                    },
                  ),
                ),
                DataCell(
                  CustomDataCellWidget(
                      title: DateFormat('MMM d, y').format(DateTime.parse(
                          item.priorityDate ?? DateTime.now().toString())),
                      subTitle: "Time: 12:00 PM"),
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
                      item.materialDescription ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Center(
                    child: Text(
                      formatNum(item.deliveryQuantity??0),
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
                      item.salesName.toString(),
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
                  CustomPriorityDeliveryAction(
                    user: widget.user,
                    orderId: item.delivery!,
                    dispatchDeliveryEntity: DispatchDeliveryEntity(
                        id: item.delivery!, agentName: agentName),
                    onTap: () async {
                      makeSureDialog(
                        context,
                        contentText: 'Are you want to dispatch this Order?',
                        submitText: 'Yes, dispatch',
                        onSubmit: () {
                          if (agentName == "") {
                            ShowSnackbar.showSnackBar(
                                context, "Please Select Agent!", 'W');
                          } else {
                            BlocProvider.of<DispatchDeliveryOrderCubit>(context)
                                .dispatchDeliveryOrders(
                              [
                                DispatchDeliveryEntity(
                                  id: item.delivery!,
                                  agentName: agentName,
                                ),
                              ],
                            );
                            Navigator.of(context).pop();
                          }
                        },
                      );
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
