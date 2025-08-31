import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/icons.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/delete_delivery_priority_order_cubit/delete_delivery_priority_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';

class CustomSubmitPriorityButtons extends StatelessWidget {
  const CustomSubmitPriorityButtons({super.key, required this.selectedOrders});
  final List<DispatchDeliveryEntity> selectedOrders;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<DeleteDeliveryPriorityOrderCubit,
            DeleteDeliveryPriorityOrderState>(
          listener: (context, state) {
            if (state is DeleteDeliveryPriorityOrderSuccess) {
              ShowSnackbar.showSnackBar(context, state.msg, 'S');
              BlocProvider.of<GetAllDeliveryCubit>(context)
                  .getAllDeliveryPriorty();
            } else if (state is DeleteDeliveryPriorityOrderFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
          },
          builder: (context, state) {
            if (state is DeleteDeliveryPriorityOrderLoading) {
              return const CustomButtonWithIcon(
                textColor: Color.fromARGB(255, 255, 200, 3),
                bgColor: Color(0xffFFFAE7),
                child: "Loading",
                icon: loadingIcon,
                onHoverColor: Color.fromARGB(255, 247, 218, 113),
                onTap: null,
              );
            }
            return CustomButtonWithIcon(
              textColor: const Color.fromARGB(255, 255, 200, 3),
              bgColor: const Color(0xffFFFAE7),
              child: "Pending Selected",
              icon: Symbols.done_all,
              onHoverColor: const Color.fromARGB(255, 247, 218, 113),
              onTap: () {
                BlocProvider.of<DeleteDeliveryPriorityOrderCubit>(context)
                    .deleteDeliveryPriorityOrder(selectedOrders.map((item) {
                  return item.id;
                }).toList());
              },
            );
          },
        ),
        const SizedBox(width: 10),
        BlocConsumer<DispatchDeliveryOrderCubit, DispatchDeliveryOrderState>(
          listener: (context, state) {
            if (state is DispatchDeliveryOrderSuccess) {
              ShowSnackbar.showSnackBar(context, state.msg, 'S');
              BlocProvider.of<GetAllDeliveryCubit>(context)
                  .getAllDeliveryPriorty();
            } else if (state is DispatchDeliveryOrderFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
          },
          builder: (context, state) {
            if (state is DispatchDeliveryOrderLoading) {
              return const CustomButtonWithIcon(
                textColor: Color.fromARGB(255, 108, 165, 230),
                bgColor: Color(0xffEFF6FE),
                child: "Loading...",
                icon: loadingIcon,
                onHoverColor: Color.fromARGB(255, 182, 208, 236),
                onTap: null,
              );
            }
            return CustomButtonWithIcon(
              textColor: const Color.fromARGB(255, 108, 165, 230),
              bgColor: const Color(0xffEFF6FE),
              child: "Dispatch Selected",
              icon: Symbols.done_all,
              onHoverColor: const Color.fromARGB(255, 182, 208, 236),
              onTap: () async {
                if (selectedOrders.where((i) => i.agentName == "").isNotEmpty) {
                  DispatchDeliveryEntity orderWithoutAgent =
                      selectedOrders.where((i) => i.agentName == "").first;
                  ShowSnackbar.showSnackBar(context,
                      "Please select agent to ${orderWithoutAgent.id}", "W");
                } else {
                  await BlocProvider.of<DispatchDeliveryOrderCubit>(context)
                      .dispatchDeliveryOrders(selectedOrders);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
