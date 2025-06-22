import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/delete_pickup_priority_cubit/delete_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/dispatch_pickup_cubit/dispatch_pickup_order_cubit.dart';

class CustomPriorityPickupActions extends StatelessWidget {
  const CustomPriorityPickupActions({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomPriorityActionsWidget(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "pending",
            child: const Row(
              children: [
                Icon(
                  Symbols.task_alt,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Delete"),
              ],
            ),
            onTap: () {
              BlocProvider.of<DeletePickupPriorityCubit>(context)
                  .deletePickupPriority([orderId]);
            },
          ),
          PopupMenuItem(
            value: "dispatch",
            child: const Row(
              children: [
                Icon(
                  Symbols.task_alt,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Dispatch"),
              ],
            ),
            onTap: () {
              BlocProvider.of<DispatchPickupOrderCubit>(context)
                  .dispatchPickupOrders([orderId]);
            },
          ),
          PopupMenuItem(
            value: "Details",
            child: const Row(
              children: [
                Icon(
                  Symbols.task_alt,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Show Details"),
              ],
            ),
            onTap: () {
              //show order details
            },
          ),
        ],
      ),
    );
  }
}
