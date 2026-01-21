import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complains_cubit/complains_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/delete_complain_cubit/delete_complain_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/complains_page_body.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class ComplainPage extends StatelessWidget {
  const ComplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ComplainsCubit>(context).getAllComplains();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) => {
        if (state is UserFailure) {GoRouter.of(context).go(AppRouter.loginPath)}
      },
      builder: (context, state) {
        if (state is UserSuccess) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'Complains',
                  style: TextStyle(fontSize: 19),
                ),
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
                  activeTab: "Complains",
                  user: state.user,
                ),
              ),
              body: BlocListener<DeleteComplainCubit, DeleteComplainState>(
                listener: (context, state) {
                  if (state is DeleteComplainSuccess) {
                    BlocProvider.of<ComplainsCubit>(context).getAllComplains();
                    ShowSnackbar.showSnackBar(context, state.msg, 'S');
                  } else if (state is DeleteComplainFailure) {
                    ShowSnackbar.showSnackBar(context, state.error, 'F');
                  }
                },
                child: ComplainsPageBody(user: state.user),
              ),
            ),
          );
        } else if (state is UserFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
        }
        return const LoadingPage(
          title: 'Complains',
        );
      },
    );
  }
}
