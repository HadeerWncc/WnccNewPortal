import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/payer/presentation/manager/cubites/payer_cubit/payer_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/customer_balance_cubit/customer_balance_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_cubit/payments_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_buttons_list.dart';

class PaymentReportButtonsList extends StatelessWidget {
  const PaymentReportButtonsList({
    super.key,
    required this.activeTab,
  });
  final int activeTab;
  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Summary', 'Details', 'Balance'],
      activeTab: activeTab,
      onTap: (value) {
        // Handle button tap
        if (value == 'Details') {
          BlocProvider.of<PaymentsDetailsCubit>(context)
              .getPaymentDetails(DateTime.now(), DateTime.now());
          GoRouter.of(context).push(AppRouter.paymentsDetailsPath);
        } else if (value == 'Summary') {
          // BlocProvider.of<PaymentsCubit>(context)
          //     .fetchPayments(2, DateTime.now(), "");
          // BlocProvider.of<PayerCubit>(context).getAllPayers();
          GoRouter.of(context).push(AppRouter.paymentsDailyPath);
        } else if (value == 'Balance') {
          BlocProvider.of<CustomerBalanceCubit>(context).getPaymentBalance();
          GoRouter.of(context).push(AppRouter.paymentsBalancePath);
        }
      },
    );
  }
}
