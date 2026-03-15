import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_per_customer_cubit/payment_per_customer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_per_customer_body.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class PaymentsPerCustomerPage extends StatelessWidget {
  const PaymentsPerCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PaymentPerCustomerCubit>(context)
        .getPaymentPerCustomer(DateTime(DateTime.now().year, DateTime.now().month, 1), DateTime.now());
   
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) => {
        if (state is UserFailure)
          {
            ShowSnackbar.showSnackBar(context, state.error, 'F'),
            GoRouter.of(context).go(AppRouter.loginPath)
          }
      },
      builder: (context, state) {
        if (state is UserSuccess) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'Payments',
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
                  activeTab: "Payments",
                  user: state.user,
                ),
              ),
              body: const PaymentsPerCustomerBody(),
            ),
          );
        }
        return const LoadingPage(
          title: "Payments",
        );
      },
    );
  }
}
