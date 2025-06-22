import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/add_pickup_priority_cubit/add_pickup_priority_cubit.dart';

class CustomPendingPickupActions extends StatelessWidget {
  const CustomPendingPickupActions({super.key, required this.orderId});
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
              BlocProvider.of<AddPickupPriorityCubit>(context)
                  .addPickupPriority([orderId]);
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
