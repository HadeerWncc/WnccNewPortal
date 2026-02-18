import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_buttons_list.dart';

class PendingReportButtonsList extends StatelessWidget {
  const PendingReportButtonsList({
    super.key,
    required this.activeTab,
  });
  final int activeTab;
  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Delivery', 'Pickup'],
      activeTab: activeTab,
      onTap: (value) {
        // Handle button tap
        if (value == 'Delivery') {
          // GoRouter.of(context).push(AppRouter.paymentsDetailsPath);
        } else if (value == 'Pickup') {
          // GoRouter.of(context).push(AppRouter.paymentsMonthlyPath);
        }
      },
    );
  }
}
