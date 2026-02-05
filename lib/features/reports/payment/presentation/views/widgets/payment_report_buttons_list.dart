
import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_buttons_list.dart';

class PaymentReportButtonsList extends StatelessWidget {
  const PaymentReportButtonsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Report', 'Details', 'Balance'],
      activeTab: 0,
      onTap: (value) {
        // Handle button tap
        if (value == 'Details') {
          // GoRouter.of(context).push(AppRouter.morningMeetingDetails);
        } else if (value == 'Balance') {
          // GoRouter.of(context).push(AppRouter.morningMeetingBalance);
        }
      },
    );
  }
}