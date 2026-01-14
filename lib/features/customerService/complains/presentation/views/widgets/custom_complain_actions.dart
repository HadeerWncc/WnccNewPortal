import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/make_sure_dialog.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/delete_complain_cubit/delete_complain_cubit.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_priority_action_widget.dart';

class CustomComplainActions extends StatelessWidget {
  const CustomComplainActions(
      {super.key,
      required this.complainId,
      required this.payerId,
      required this.complainEntity});
  final String complainId;
  final String payerId;
  final ComplainEntity complainEntity;
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
                Text("Edit Complain"),
              ],
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.editComplainPage, extra: {
                "id": complainId,
                "payerId": payerId,
                "complainEntity": complainEntity,
              });
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
                Text("Delete Complain"),
              ],
            ),
            onTap: () {
              makeSureDialog(
                context,
                contentText: 'Are you want to delete this Complain?',
                submitText: 'Yes, Delete',
                onSubmit: () {
                  BlocProvider.of<DeleteComplainCubit>(context)
                      .removeComplain(complainId);
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
