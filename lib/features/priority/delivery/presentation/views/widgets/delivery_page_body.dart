import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/add_delivery_priority_cubit/add_delivery_priority_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/delete_delivery_priority_order_cubit/delete_delivery_priority_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_delivery_by_id_cubit/get_delivery_by_id_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/undispatch_delivery_order_cubit/undispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/delivery_main_data.dart';

class DeliveryPageBody extends StatelessWidget {
  const DeliveryPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(create: (context) {
          return getIt<GetDeliveryByIdCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<AddDeliveryPriorityCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<DeleteDeliveryPriorityOrderCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<UndispatchDeliveryOrderCubit>();
        }),
      ],
      child: ListView(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const DeliveryMainData(),
          )
        ],
      ),
    );
  }
}
