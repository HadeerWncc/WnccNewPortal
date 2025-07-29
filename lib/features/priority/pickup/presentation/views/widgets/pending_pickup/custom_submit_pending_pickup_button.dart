import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/add_pickup_priority_cubit/add_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';

class CustomSubmitPendingPickupButton extends StatelessWidget {
  const CustomSubmitPendingPickupButton(
      {super.key, required this.selectedOrders});
  final List<String> selectedOrders;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<AddPickupPriorityCubit, AddPickupPriorityState>(
          listener: (context, state) {
            if (state is AddPickupPrioritySuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              BlocProvider.of<GetallPickupCubit>(context)
                  .getAllPendingPickupOrders();
            } else if (state is AddPickupPriorityFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is AddPickupPriorityLoading) {
              return const CustomButtonWithIcon(
                textColor: Color.fromARGB(255, 108, 165, 230),
                bgColor: Color(0xffEFF6FE),
                child: "loading",
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
                BlocProvider.of<AddPickupPriorityCubit>(context)
                    .addPickupPriority(selectedOrders);
              },
            );
          },
        ),
      ],
    );
  }
}
