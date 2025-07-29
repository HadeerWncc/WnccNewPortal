import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/delete_pickup_priority_cubit/delete_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/dispatch_pickup_cubit/dispatch_pickup_order_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';

class PriorityPickupSubmitButtons extends StatelessWidget {
  const PriorityPickupSubmitButtons({super.key, required this.selectedOrders});
  final List<String> selectedOrders;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<DeletePickupPriorityCubit, DeletePickupPriorityState>(
          listener: (context, state) {
            if (state is DeletePickupPrioritySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              BlocProvider.of<GetallPickupCubit>(context)
                  .getAllPriorityPickupOrders();
            } else if (state is DeletePickupPriorityFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is DeletePickupPriorityLoading) {
              return const CustomButtonWithIcon(
                textColor: Color.fromARGB(255, 255, 200, 3),
                bgColor: Color(0xffFFFAE7),
                child: "Loading...",
                icon: Symbols.progress_activity,
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
                BlocProvider.of<DeletePickupPriorityCubit>(context)
                    .deletePickupPriority(selectedOrders);
              },
            );
          },
        ),
        const SizedBox(width: 10),
        BlocConsumer<DispatchPickupOrderCubit, DispatchPickupOrderState>(
          listener: (context, state) {
            if (state is DispatchPickupOrderSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              BlocProvider.of<GetallPickupCubit>(context)
                  .getAllPriorityPickupOrders();
            } else if (state is DispatchPickupOrderFaliure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is DispatchPickupOrderLoading) {
              return const CustomButtonWithIcon(
                textColor: Color.fromARGB(255, 108, 165, 230),
                bgColor: Color(0xffEFF6FE),
                child: "Loading...",
                icon: Symbols.progress_activity,
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
              onTap: () {
                BlocProvider.of<DispatchPickupOrderCubit>(context)
                    .dispatchPickupOrders(selectedOrders);
              },
            );
          },
        ),
      ],
    );
  }
}
