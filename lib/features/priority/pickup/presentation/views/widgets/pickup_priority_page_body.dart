import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/add_pickup_priority_cubit/add_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/delete_pickup_priority_cubit/delete_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/dispatch_pickup_cubit/dispatch_pickup_order_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_pickup_by_id_cubit/get_pickup_by_id_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/undispatch_pickup_cubit/undispatch_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/widgets/pickup_main_data.dart';

class PickupPriorityPageBody extends StatelessWidget {
  const PickupPriorityPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AddPickupPriorityCubit>()),
        BlocProvider(create: (context) => getIt<DeletePickupPriorityCubit>()),
        BlocProvider(create: (context) => getIt<DispatchPickupOrderCubit>()),
        BlocProvider(create: (context) => getIt<UndispatchPickupCubit>()),
        BlocProvider(create: (context) => getIt<GetallPickupCubit>()),
        BlocProvider(create: (context) => getIt<GetPickupByIdCubit>()),
      ],
      child: ListView(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const PickupMainData(),
          )
        ],
      ),
    );
  }
}
