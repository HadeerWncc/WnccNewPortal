import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/get_pickupility_cubit/get_pickupility_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pickup_table_with_filter.dart';

class PickupMainData extends StatelessWidget {
  const PickupMainData({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: DatePicker(
            title: 'Selected Pickup Date',
            onChange: (value) {
              date = value;
              BlocProvider.of<GetPickupilityCubit>(context).getAllPickup(date);
            },
          ),
        ),
        // const SizedBox(height: 10),
        // const PrioritySummary(),
        const SizedBox(height: 10),
        const DividerLine(),
        const SizedBox(height: 10),
        PickupTableWithFilter(
          date: date,
          user: user,
        ),
      ],
    );
  }
}
