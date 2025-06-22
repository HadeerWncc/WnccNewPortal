import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/undispatch_pickup_cubit/undispatch_pickup_cubit.dart';

class SubmitDispatchPickupButtons extends StatelessWidget {
  const SubmitDispatchPickupButtons({super.key, required this.selectedOrders, required this.date});
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
              child: "Priority Selected",
              icon: Symbols.done_all,
              onHoverColor: const Color.fromARGB(255, 182, 208, 236),
              onTap: () {
                BlocProvider.of<UndispatchPickupCubit>(context)
                    .undispatchPickupOrders(selectedOrders);
              },
            );
          },
        ),
      ],
    );
  }
}
