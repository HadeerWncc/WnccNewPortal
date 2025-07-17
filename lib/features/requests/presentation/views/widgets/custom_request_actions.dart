import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';

class CustomRequestActions extends StatelessWidget {
  const CustomRequestActions({super.key, required this.requestId});
  final String requestId;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomPriorityActionsWidget(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "Edit",
            child: const Row(
              children: [
                Icon(
                  Symbols.edit_square,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Edit Request"),
              ],
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.editRequestPage);
            },
          ),
          PopupMenuItem(
            value: "Delete",
            child: const Row(
              children: [
                Icon(
                  Symbols.delete,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text("Delete Request"),
              ],
            ),
            onTap: () {
              showDeleteRequestDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDeleteRequestDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8)),
          icon: const Icon(
            Symbols.error,
            color: Colors.amber,
            size: 70,
          ),
          title: const Text(
            "Are You Sure?",
            textAlign: TextAlign.center,
          ),
          content: const Text(
            "Are you want to delete this request?",
            textAlign: TextAlign.center,
          ),
          actions: [
            CustomButton(
              onTap: () {},
              contant: 'Yes, Delete',
              color: const Color(0xff2B87DE),
            ),
            CustomButton(
              onTap: () {
                GoRouter.of(context).pop();
              },
              contant: 'Cancel',
              color: const Color.fromARGB(255, 244, 98, 88),
            ),
          ],
        );
      },
    );
  }
}
