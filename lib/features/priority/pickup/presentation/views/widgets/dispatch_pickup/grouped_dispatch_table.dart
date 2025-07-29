import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_checkbox.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_data_cell_widget.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/dispatch_pickup/custom_dispatch_pickup_actions.dart';

class GroupedDispatchTable extends StatefulWidget {
  final List<DispatchPickupOrder> orders;
  final Function(List<String> ordersId) onSelectOrders;

  const GroupedDispatchTable(
      {super.key, required this.orders, required this.onSelectOrders});

  @override
  State<GroupedDispatchTable> createState() => _GroupedDispatchTableState();
}

class _GroupedDispatchTableState extends State<GroupedDispatchTable> {
  final Map<String, bool> _expandedPayers = {};
  List<String> orders = [];
  @override
  Widget build(BuildContext context) {
    Map<String, List<DispatchPickupOrder>> grouped = {};
    for (var order in widget.orders) {
      grouped.putIfAbsent(order.payerName ?? "", () => []).add(order);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 600, // عرض مناسب حسب عدد الأعمدة، زودي أو صغري حسب الحاجة
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
                    ...orders.map((order) => _buildDataRow(
                        order,
                        orders.indexOf(order) % 2 == 0
                            ? const Color(0xffF9FAFC)
                            : const Color(0xffFFFFFF))),
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

  Widget _buildDataRow(DispatchPickupOrder order, Color color) {
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
                if (value != null) {
                  orders.add(value);
                } else {
                  orders.removeWhere((element) => element == order.id!);
                }
                widget.onSelectOrders(orders);
              },
            ),
            // Checkbox(value: false, onChanged: (_) {})
          ),
          Expanded(
            child: CustomDataCellWidget(
              title: order.productName ?? "",
              subTitle: "product: ${order.productName}",
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
              title: DateFormat('MMMM d, y')
                  .format(order.dispatchDate ?? DateTime.now()),
              subTitle: 'time: 12:00 PM',
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomDispatchPickupActions(
              orderId: order.id!,
            ),
          ),
        ],
      ),
    );
  }
}
