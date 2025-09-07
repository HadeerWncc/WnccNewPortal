import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/make_sure_dialog.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/add_delivery_priority_cubit/add_delivery_priority_cubit.dart';

class CustomPendingDeliveryActions extends StatelessWidget {
  const CustomPendingDeliveryActions({
    super.key,
    required this.orderId,
  });
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
                Text("Add to Priority"),
              ],
            ),
            onTap: () {
              makeSureDialog(
                context,
                contentText: 'Are you want to Add this Order to Priority?',
                submitText: 'Yes, Add',
                onSubmit: () {
                  BlocProvider.of<AddDeliveryPriorityCubit>(context)
                      .addDeliveryPriority([orderId], false);
                  GoRouter.of(context).pop();
                },
              );
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
