import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:wncc_portal/features/priority/comm/models/order_response/order_response.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/priority_pickup/custom_priority_pickup_actions.dart';

class GroupedPriorityTable extends StatefulWidget {
  final List<OrderResponse> orders;
  final Function(List<String> ordersId) onSelectOrders;

  const GroupedPriorityTable(
      {super.key, required this.orders, required this.onSelectOrders});

  @override
  State<GroupedPriorityTable> createState() => _GroupedPriorityTableState();
}

class _GroupedPriorityTableState extends State<GroupedPriorityTable> {
  final Map<String, bool> _expandedPayers = {};
  List<String> orders = [];
  @override
  Widget build(BuildContext context) {
    Map<String, List<OrderResponse>> grouped = {};
    for (var order in widget.orders) {
      grouped.putIfAbsent(order.payer?.fullName ?? "", () => []).add(order);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderRow(),
            const Divider(
              height: .5,
              color: Color.fromARGB(255, 226, 226, 226),
            ),
            ...grouped.entries.map((entry) {
              final payer = entry.key;
              final orders = entry.value;
              final payerTotal = entry.value
                  .fold<num>(0, (sum, order) => sum + (order.quantity ?? 0));
              final isExpanded = _expandedPayers[payer] ?? true;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _expandedPayers[payer] = !isExpanded;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xffFEFBEA),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      child: Row(
                        children: [
                          // const SizedBox(width: 20),
                          Icon(isExpanded
                              ? Symbols.keyboard_arrow_down
                              : Symbols.keyboard_arrow_right),
                          const SizedBox(width: 10),
                          Text(
                            '$payer   ($payerTotal)',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded)
                    ...orders.map(
                      (order) => _buildDataRow(
                        order,
                        orders.indexOf(order) % 2 == 0
                            ? const Color(0xffF9FAFC)
                            : const Color(0xffFFFFFF),
                      ),
                    )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: const BoxDecoration(
          color: Color(0xffF9FAFC),
          border: Border(
              top: BorderSide(
                  color: Color.fromARGB(255, 163, 160, 160), width: 1))),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Select',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                'Product',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ))),
          Expanded(
              child: Center(
                  child: Text(
            'Quantity',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ))),
          Expanded(
              child: Center(
                  child: Text(
            'Registered At',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ))),
          Expanded(
              child: Center(
                  child: Text(
            'Actions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ))),
        ],
      ),
    );
  }

  Widget _buildDataRow(OrderResponse order, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: const Border(bottom: BorderSide(color: Colors.grey)),
        color: color,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomDataCellCheckbox(
              orderId: order.id!,
              onChanged: (value) {
                //save orderId
                if (value == true) {
                  orders.add(order.id!);
                } else {
                  orders.removeWhere((element) => element == order.id!);
                }
                widget.onSelectOrders(orders);
              },
            ),
            // Checkbox(value: false, onChanged: (_) {})
          ),
          Expanded(
            flex: 2,
            child: CustomDataCellWidget(
              title: order.product?.name ?? "",
              subTitle: "category: ${order.product?.category ?? ""}",
            ),
          ),
          Expanded(
            child: CustomDataCellWidget(
              title: '${order.quantity} ',
              subTitle: 'price: ${order.price?.toString()}',
            ),
          ),
          Expanded(
            child: CustomDataCellWidget(
              title: DateFormat('MMM d, y')
                  .format(order.priorityDate ?? DateTime.now()),
              subTitle: 'time: 12:00 PM',
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomPriorityPickupActions(
              orderId: order.id!,
            ),
          ),
        ],
      ),
    );
  }
}
