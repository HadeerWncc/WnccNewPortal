import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_details_bloc_consumer.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class RequestDetailsPage extends StatelessWidget {
  const RequestDetailsPage(
      {super.key, required this.requestId, required this.user});
  final String requestId;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RequestDetailsCubit>(context).openRequest(requestId);

    return SafeArea(
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Scaffold(
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text('Requests'),
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
                  activeTab: "Requests",
                  user: state.user,
                ),
              ),
              body:
                  RequestDetailsBlocConsumer(requestId: requestId, user: user),
            );
          } else if (state is UserFailure) {
            GoRouter.of(context).go(AppRouter.loginPath);
          }
          return const LoadingPage(
            title: 'Requests',
          );
        },
      ),
    );
  }
}
