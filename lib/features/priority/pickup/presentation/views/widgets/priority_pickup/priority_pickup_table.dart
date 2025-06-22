import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/priority_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/priority_pickup/grouped_priority_table.dart';

class PriorityPickupTable extends StatelessWidget {
  const PriorityPickupTable(
      {super.key, required this.onSelectOrders, required this.orders});
  final Function(List<String> ordersId) onSelectOrders;
  final List<PriorityPickupOrder> orders;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView(children: [
        GroupedPriorityTable(
          orders: orders,
          onSelectOrders:(ordersId) {
            onSelectOrders(ordersId);
          },
        )
      ]),
    );
  }
}
