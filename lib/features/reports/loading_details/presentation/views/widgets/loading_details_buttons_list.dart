import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_buttons_list.dart';

class LoadingDetailsButtonsList extends StatelessWidget {
  const LoadingDetailsButtonsList({
    super.key,
    required this.activeTab,
  });
  final int activeTab;
  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Details', 'Process', 'Report'],
      activeTab: activeTab,
      onTap: (value) {
        // Handle button tap
        if (value == 'Details') {
          GoRouter.of(context).push(AppRouter.loadingDetailsPath);
        } else if (value == 'Process') {
          // GoRouter.of(context).push(AppRouter.paymentsMonthlyPath);
        } else if (value == 'Report') {
          // GoRouter.of(context).push(AppRouter.morningMeetingBalance);
        }
      },
    );
  }
}
