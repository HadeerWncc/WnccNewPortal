import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/priority/comm/entities/get_summary_entity.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/get_pickup_summary_cubit/get_pickup_summary_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubites/get_pickupility_cubit/get_pickupility_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pickup_main_data.dart';

class PickupPriorityBody extends StatelessWidget {
  const PickupPriorityBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetPickupilityCubit>(context).getAllPickup(DateTime.now());
    BlocProvider.of<GetPickupSummaryCubit>(context).getPickupSummary(
        GetSummaryEntity(
            date: DateTime.now(), salesId: "", regionId: "", matrialId: ""));

    return ListView(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: PickupMainData(
            user: user,
          ),
        )
      ],
    );
  }
}
