import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/priority/pickup/domin/entities/make_pickupility_entity.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/get_pickupility_cubit/get_pickupility_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/set_pickup_priority_cubit/set_pickup_priority_cubit.dart';

class CustomSubmitUpdatePickupPriority extends StatelessWidget {
  const CustomSubmitUpdatePickupPriority(
      {super.key, required this.date, required this.makePickupility});
  final DateTime date;
  final MakePickupilityEntity makePickupility;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<SetPickupPriorityCubit, SetPickupPriorityState>(
          listener: (context, state) {
            if (state is SetPickupPrioritySuccess) {
              ShowSnackbar.showSnackBar(context, state.successMsg, 'S');
              BlocProvider.of<GetPickupilityCubit>(context).getAllPickup(date);
            } else if (state is SetPickupPriorityFailure) {
              ShowSnackbar.showSnackBar(context, state.errorMsg, 'F');
            }
          },
          builder: (context, state) {
            if (state is SetPickupPriorityLoading) {
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
                BlocProvider.of<SetPickupPriorityCubit>(context)
                    .setPickupPriority(makePickupility);
              },
            );
          },
        ),
      ],
    );
  }
}
