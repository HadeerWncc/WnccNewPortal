import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
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
              ShowSnackbar.showSnackBar(context, state.msg, 'S');
              BlocProvider.of<GetAllDeliveryCubit>(context)
                  .getDeliveryDispatchByDate(date);
            } else if (state is UndispatchDeliveryOrderFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
          },
          builder: (context, state) {
            if (state is UndispatchDeliveryOrderLoading) {
              return const CustomButtonWithIcon(
                textColor: kMainColor,
                bgColor: Color.fromARGB(255, 239, 254, 243),
                child: "Loading",
                icon: Symbols.progress_activity,
                onHoverColor: Color.fromARGB(255, 182, 236, 211),
                onTap: null,
              );
            }
            return CustomButtonWithIcon(
              textColor: kMainColor,
              bgColor: const Color.fromARGB(255, 239, 254, 246),
              child: "Priority Selected",
              icon: Symbols.done_all,
              onHoverColor: const Color.fromARGB(255, 182, 236, 205),
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
