import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/delete_delivery_priority_order_cubit/delete_delivery_priority_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';

class CustomPriorityDeliveryAction extends StatelessWidget {
  const CustomPriorityDeliveryAction({super.key, required this.orderId, required this.dispatchDeliveryEntity});
  final String orderId;
  final DispatchDeliveryEntity dispatchDeliveryEntity;

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
                Text("Delete order"),
              ],
            ),
            onTap: () {
              BlocProvider.of<DeleteDeliveryPriorityOrderCubit>(context)
                  .deleteDeliveryPriorityOrder([orderId]);
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
                Text("Dispatch order"),
              ],
            ),
            onTap: () async {
              //Add order to priority
              // selectAgent(
              //   context,
              //   [dispatchDeliveryEntity],
              // );
              await BlocProvider.of<DispatchDeliveryOrderCubit>(context)
                        .dispatchDeliveryOrders([dispatchDeliveryEntity]);
                        
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
