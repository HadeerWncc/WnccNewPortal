import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/cubites/flat_dispatch_details_cubit/flat_dispatch_details_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_detasils_v2_per_region_cubit/dispatch_detasils_v2_per_region_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_buttons_list.dart';

class DispatchDetailsHeaderTabs extends StatelessWidget {
  const DispatchDetailsHeaderTabs({
    super.key,
    required this.activeTab,
  });
  final int activeTab;
  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Summary', 'Details'],
      activeTab: activeTab,
      onTap: (value) {
        // Handle button tap
        if (value == 'Summary') {
          BlocProvider.of<DispatchDetasilsV2PerRegionCubit>(context)
              .getDispatchDetailsV2PerRegion(DateTime.now(), 0);
          GoRouter.of(context).push(AppRouter.dispatchDetailsPerRegionPath);
        } else if (value == 'Details') {
          BlocProvider.of<FlatDispatchDetailsCubit>(context)
              .getFlatDispatchDetails(DateTime.now());
          GoRouter.of(context).push(AppRouter.dispatchDetailsPath);
        }
      },
    );
  }
}
