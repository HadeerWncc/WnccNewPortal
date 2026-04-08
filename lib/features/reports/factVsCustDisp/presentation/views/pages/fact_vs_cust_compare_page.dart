import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/errors/handel_error.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_compare_cubit/fact_vs_cust_compare_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/fact_vs_cust_page_compare_body.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class FactVsCustComparePage extends StatelessWidget {
  const FactVsCustComparePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FactVsCustCompareCubit>(context).getFactVsCustDispCompare(
        DateTime.now(), DateTime(DateTime.now().year - 1, 1, 1));

    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) => handelError(state, context),
      builder: (context, state) {
        if (state is UserSuccess) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'Compare',
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
                  activeTab: "FactoryVsCustDispatch",
                  user: state.user,
                ),
              ),
              body: const FactVsCustPageCompareBody(),
            ),
          );
        }
        return const LoadingPage(
          title: "FactoryVsCustDispatch",
        );
      },
    );
  }
}
