import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_buttons_list.dart';

class DispatchDetailsButtonsList extends StatelessWidget {
  const DispatchDetailsButtonsList({
    super.key,
    required this.activeTab,
  });
  final int activeTab;
  @override
  Widget build(BuildContext context) {
    return CustomButtonsList(
      buttons: const ['Summary', 'Details'],
      activeTab: activeTab,
      onTap: (value) {
        // Handle button tap
        if (value == 'Details') {
          // GoRouter.of(context).push(AppRouter.paymentsDetailsPath);
        } else if (value == 'Summary') {
          GoRouter.of(context).push(AppRouter.dispatchDetailsPath);
        } 
      },
    );
  }
}
