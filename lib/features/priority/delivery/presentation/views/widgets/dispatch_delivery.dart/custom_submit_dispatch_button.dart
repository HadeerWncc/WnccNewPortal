import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/undispatch_delivery_order_cubit/undispatch_delivery_order_cubit.dart';

class CustomSubmitDispatchButton extends StatelessWidget {
  const CustomSubmitDispatchButton(
      {super.key, required this.selectedOrders, required this.date});
  final List<String> selectedOrders;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<UndispatchDeliveryOrderCubit,
            UndispatchDeliveryOrderState>(
          listener: (context, state) {
            if (state is UndispatchDeliveryOrderSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.msg),
                ),
              );
              BlocProvider.of<GetAllDeliveryCubit>(context)
                  .getDeliveryDispatchByDate(date);
            } else if (state is UndispatchDeliveryOrderFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UndispatchDeliveryOrderLoading) {
              return const CustomButtonWithIcon(
                textColor: Color.fromARGB(255, 108, 165, 230),
                bgColor: Color(0xffEFF6FE),
                child: "Loading",
                icon: Symbols.progress_activity,
                onHoverColor: Color.fromARGB(255, 182, 208, 236),
                onTap: null,
              );
            }
            return CustomButtonWithIcon(
              textColor: const Color.fromARGB(255, 108, 165, 230),
              bgColor: const Color(0xffEFF6FE),
              child: "Priority Selected",
              icon: Symbols.done_all,
              onHoverColor: const Color.fromARGB(255, 182, 208, 236),
              onTap: () {
                BlocProvider.of<UndispatchDeliveryOrderCubit>(context)
                    .undispatchDeliveryOrders(selectedOrders);
              },
            );
          },
        ),
      ],
    );
  }
}
