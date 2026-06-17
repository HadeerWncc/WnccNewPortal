import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_buttons_list.dart';

class PerSalesHeaderTabs extends StatelessWidget {
  const PerSalesHeaderTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Summary', 'Details'],
      activeTab: 0,
      onTap: (value) {
        // Handle button tap
        if (value == 'Summary') {
          // BlocProvider.of<PaymentsDetailsCubit>(context)
          //     .getPaymentDetails(DateTime.now(), DateTime.now());
          // GoRouter.of(context).push(AppRouter.paymentsDetailsPath);
        } else if (value == 'Details') {
          // GoRouter.of(context).push(AppRouter.paymentsDailyPath);
        }
      },
    );
  }
}
