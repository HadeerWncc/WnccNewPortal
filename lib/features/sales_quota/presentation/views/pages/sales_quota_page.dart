import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/sales_quota_body.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class SalesQuotaPage extends StatelessWidget {
  const SalesQuotaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) => {
        if (state is UserFailure)
          {
            ShowSnackbar.showSnackBar(context, state.error, 'F'),
            GoRouter.of(context).go(AppRouter.loginPath),
          }
      },
      builder: (context, state) {
        if (state is UserSuccess) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xffF0F4F7),
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'SalesQuota',
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
                child:
                    CustomMenusList(user: state.user, activeTab: 'Sales Quota'),
              ),
              body: const SalesQuotaBody(),
            ),
          );
        }
        return const LoadingPage(
          title: 'Sales Quota',
        );
      },
    );
  }
}
