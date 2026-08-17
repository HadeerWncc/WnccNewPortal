import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/errors/handel_error.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/reports/pending/presentation/manager/pickup_pending_cubit/pickup_pending_cubit.dart';
import 'package:wncc_portal/features/reports/pending/presentation/views/widgets/pickup_pending_body.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class PickupPendingPage extends StatelessWidget {
  const PickupPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PickupPendingCubit>(context).getPendingPickup();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) => handelError(state, context),
      builder: (context, state) {
        if (state is UserSuccess) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'Pending Pickup',
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
                  activeTab: "Pending",
                  user: state.user,
                ),
              ),
              body: const PickupPendingBody(),
            ),
          );
        }
        return const LoadingPage(
          title: "Pending",
        );
      },
    );
  }
}
