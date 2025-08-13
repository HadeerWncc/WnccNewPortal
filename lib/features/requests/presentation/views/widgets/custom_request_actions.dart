import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/make_sure_dialog.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';
import 'package:wncc_portal/features/requests/presentation/managers/remove_request_cubit/remove_request_cubit.dart';

class CustomRequestActions extends StatelessWidget {
  const CustomRequestActions({super.key, required this.requestId, required this.payerId});
  final String requestId;
  final String payerId;
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
              GoRouter.of(context).push(
                AppRouter.editRequestPage,
                extra: {
                  'payerId': payerId,
                  'id': requestId,
                },
              );
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
              makeSureDialog(
                context,
                contentText: 'Are you want to delete this request?',
                submitText: 'Yes, Delete',
                onSubmit: () {
                  BlocProvider.of<RemoveRequestCubit>(context).removeRequest(requestId);
                  GoRouter.of(context).pop();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
