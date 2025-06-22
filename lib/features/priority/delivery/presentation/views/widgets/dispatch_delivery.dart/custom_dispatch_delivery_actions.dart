import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/undispatch_delivery_order_cubit/undispatch_delivery_order_cubit.dart';

class CustomDispatchDeliveryActions extends StatelessWidget {
  const CustomDispatchDeliveryActions({super.key, required this.orderId});
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomPriorityActionsWidget(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "ToPriority",
            child: const Row(
              children: [
                Icon(
                  Symbols.task_alt,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Undispatch"),
              ],
            ),
            onTap: () {
              BlocProvider.of<UndispatchDeliveryOrderCubit>(context)
                  .undispatchDeliveryOrders([orderId]);
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
              GoRouter.of(context).push(
                AppRouter.detailsPage,
                // extra: orderId,
              );
            },
          ),
        ],
      ),
    );
  }
}
