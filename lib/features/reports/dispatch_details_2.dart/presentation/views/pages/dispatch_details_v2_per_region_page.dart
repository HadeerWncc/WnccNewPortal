import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/errors/handel_error.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/manager/cubits/dispatch_detasils_v2_per_region_cubit/dispatch_detasils_v2_per_region_cubit.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/presentation/views/widgets/dispatch_details_vs_per_region_body.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class DispatchDetailsV2PerRegionPage extends StatelessWidget {
  const DispatchDetailsV2PerRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) => handelError(state, context),
      builder: (context, state) {
        if (state is UserSuccess) {
          BlocProvider.of<DispatchDetasilsV2PerRegionCubit>(context)
              .getDispatchDetailsV2PerRegion(DateTime.now(), 0);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'Per Region',
                  style: TextStyle(fontSize: 20),
                ),
                titleSpacing: 0.0,
                actions: [
                  CustomAppbarActions(
                    user: state.user,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              drawer: Drawer(
                shape: drawerBorde(),
                child: CustomMenusList(
                  activeTab: "Dispatch Details",
                  user: state.user,
                ),
              ),
              body: const DispatchDetailsV2PerRegionBody(),
            ),
          );
        }
        return const LoadingPage(
          title: "Per Region",
        );
      },
    );
  }
}
