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
      buttons: const ['PerRegion', 'PerSales', 'PerCustomer'],
      activeTab: activeTab,
      onTap: (value) {
        // Handle button tap
        if (value == 'PerRegion') {
          GoRouter.of(context).push(AppRouter.dispatchDetailsPath);
        } else if (value == 'PerSales') {
          GoRouter.of(context).push(AppRouter.dispatchDetailsPerSalesPath);
        } else {
          GoRouter.of(context).push(AppRouter.dispatchDetailsPerCustomerPath);
        }
      },
    );
  }
}
