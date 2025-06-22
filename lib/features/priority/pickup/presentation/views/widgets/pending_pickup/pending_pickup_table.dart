import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/models/pending_order.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pending_pickup/grouped_pending_table.dart';

class PendingPickupTable extends StatelessWidget {
  const PendingPickupTable({super.key, required this.onSelectOrders, required this.orders});
  final Function(List<String> ordersId) onSelectOrders;
  final List<PendingOrder> orders;
  @override
  Widget build(BuildContext context) {
    // List<String> orders = [];

    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView(children: [
        GroupedPendingTable(
          orders: orders,
          onSelectOrders: (ordersId) {
            onSelectOrders(ordersId);
          },
        )
      ]),
    );
  }
}
