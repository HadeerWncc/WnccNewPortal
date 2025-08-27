import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/add_delivery_priority_cubit/add_delivery_priority_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';

class CustomSubmitPendingButtons extends StatefulWidget {
  const CustomSubmitPendingButtons({
    super.key,
    required this.selectedOrders,
  });
  final List<String> selectedOrders;
  @override
  State<CustomSubmitPendingButtons> createState() =>
      _CustomSubmitPendingButtonsState();
}

class _CustomSubmitPendingButtonsState
    extends State<CustomSubmitPendingButtons> {
  String actionType = "Cancel";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: actionType == "Cancel"
          ? [
              BlocListener<AddDeliveryPriorityCubit, AddDeliveryPriorityState>(
                listener: (context, state) {
                  if (state is AddDeliveryPrioritySuccess) {
                    ShowSnackbar.showSnackBar(context, state.msg, 'S');

                    BlocProvider.of<GetAllDeliveryCubit>(context)
                        .getAllDeliveryPending();
                  }
                },
                child: CustomButtonWithIcon(
                  textColor: const Color.fromARGB(255, 108, 165, 230),
                  bgColor: const Color(0xffEFF6FE),
                  child: "Priority Selected",
                  icon: Symbols.done_all,
                  onHoverColor: const Color.fromARGB(255, 182, 208, 236),
                  onTap: () {
                    actionType = "Priority Selected";
                    setState(() {});
                  },
                ),
              ),
            ]
          : [
              CustomButtonWithIcon(
                textColor: const Color.fromARGB(255, 255, 50, 128),
                bgColor: const Color(0xffFFEDF4),
                child: "Cancel",
                icon: Symbols.block,
                onHoverColor: const Color.fromARGB(255, 253, 100, 159),
                onTap: () {
                  actionType = "Cancel";
                  setState(() {});
                },
              ),
              const SizedBox(width: 10),
              BlocBuilder<AddDeliveryPriorityCubit, AddDeliveryPriorityState>(
                builder: (context, state) {
                  if (state is AddDeliveryPriorityLoading) {
                    return const CustomButtonWithIcon(
                        textColor: Color.fromARGB(255, 108, 165, 230),
                        bgColor: Color(0xffEFF6FE),
                        child: "Loading",
                        icon: Symbols.progress_activity,
                        onHoverColor: Color.fromARGB(255, 182, 208, 236),
                        onTap: null);
                  }
                  return CustomButtonWithIcon(
                    textColor: const Color.fromARGB(255, 108, 165, 230),
                    bgColor: const Color(0xffEFF6FE),
                    child: "As Truck",
                    icon: Symbols.done_all,
                    onHoverColor: const Color.fromARGB(255, 182, 208, 236),
                    onTap: () {
                      if (widget.selectedOrders.length < 2) {
                        ShowSnackbar.showSnackBar(
                            context,
                            'You Can not add one truck on less than 2 Orders',
                            'W');
                      } else {
                        BlocProvider.of<AddDeliveryPriorityCubit>(context)
                            .addDeliveryPriority(widget.selectedOrders, true);
                      }
                    },
                  );
                },
              ),
              const SizedBox(width: 10),
              BlocConsumer<AddDeliveryPriorityCubit, AddDeliveryPriorityState>(
                listener: (context, state) {
                  if (state is AddDeliveryPrioritySuccess) {
                    BlocProvider.of<GetAllDeliveryCubit>(context)
                        .getAllDeliveryPending();
                    ShowSnackbar.showSnackBar(context, state.msg, 'S');
                  } else if (state is AddDeliveryPriorityFailure) {
                    ShowSnackbar.showSnackBar(context, state.error, 'F');
                  }
                },
                builder: (context, state) {
                  if (state is AddDeliveryPriorityLoading) {
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
                    child: "As Single",
                    icon: Symbols.done_all,
                    onHoverColor: const Color.fromARGB(255, 182, 208, 236),
                    onTap: () {
                      BlocProvider.of<AddDeliveryPriorityCubit>(context)
                          .addDeliveryPriority(widget.selectedOrders, false);
                    },
                  );
                },
              ),
            ],
    );
  }
}
