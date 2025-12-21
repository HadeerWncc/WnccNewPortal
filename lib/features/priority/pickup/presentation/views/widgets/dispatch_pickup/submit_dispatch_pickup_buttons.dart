import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/add_pickup_priority_cubit/add_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/undispatch_pickup_cubit/undispatch_pickup_cubit.dart';

class SubmitDispatchPickupButtons extends StatelessWidget {
  const SubmitDispatchPickupButtons(
      {super.key, required this.selectedOrders, required this.date});
  final List<String> selectedOrders;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<UndispatchPickupCubit, UndispatchPickupState>(
          listener: (context, state) {
            if (state is UndispatchPickupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
              BlocProvider.of<GetallPickupCubit>(context)
                  .getAllDispatchPickupOrders(date);
            } else if (state is UndispatchPickupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error: ${state.error}"),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UndispatchPickupLoading) {
              return const CustomButtonWithIcon(
                textColor: kMainColor,
                bgColor: Color.fromARGB(255, 239, 254, 248),
                child: "Loading...",
                icon: Symbols.progress_activity,
                onHoverColor: Color.fromARGB(255, 182, 236, 214),
                onTap: null,
              );
            }
            return CustomButtonWithIcon(
              textColor: kMainColor,
              bgColor: const Color.fromARGB(255, 239, 254, 248),
              child: "Priority Selected",
              icon: Symbols.done_all,
              onHoverColor: const Color.fromARGB(255, 182, 236, 214),
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
