import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/pickup/data/models/dispatch_pickup_order.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/dispatch_pickup/grouped_dispatch_table.dart';

class DispatchPickupTable extends StatelessWidget {
  const DispatchPickupTable(
      {super.key, required this.onSelectOrders, required this.orders});
  final Function(List<String> ordersId) onSelectOrders;
  final List<DispatchPickupOrder> orders;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView(children: [
        GroupedDispatchTable(
          orders: orders,
          onSelectOrders: onSelectOrders,
        )
      ]),
    );
  }
}
