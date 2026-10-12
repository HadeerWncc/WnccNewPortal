import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/customer_drawer_menu.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/customer_menu_item.dart';

class DrawerMenuList extends StatelessWidget {
  const DrawerMenuList({
    super.key,
    required this.activeTab,
    required this.user, required this.userPos,
  });
  final String activeTab;
  final UserModel user;
  final String userPos;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        CustomMenuItem(
          title: 'Home',
          active: activeTab == 'Home',
          onTap: () {
            GoRouter.of(context).push(AppRouter.homePath);
          },
        ),
        CustomDrawerMenu(
          icon: Icons.keyboard_double_arrow_up,
          title: 'Priority',
          children: [
            if (user.permissions!.contains("Permissions.Quotas.View"))
              CustomMenuItem(
                title: 'Sales Quota',
                active: activeTab == 'Sales Quota',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.salesQuotaPath);
                },
              ),
            if (user.permissions!.contains("Permissions.Deliveries.View"))
              CustomMenuItem(
                title: 'Delivery',
                active: activeTab == 'Delivery',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.deliveryPath);
                },
              ),
              if (user.permissions!.contains("Permissions.Pickups.View"))
            CustomMenuItem(
              title: 'PickUp',
              active: activeTab == 'PickUp',
              onTap: () {
                GoRouter.of(context).push(AppRouter.pickupPath);
              },
            ),
            if (user.permissions!.contains("Permissions.QuotaSummary.View"))
            CustomMenuItem(
              title: 'Summary',
              active: activeTab == 'Summary',
              onTap: () {
                GoRouter.of(context).push(AppRouter.prioritySummaryPath);
              },
            ),
          ],
        ),
         if (user.permissions!.contains("Permissions.Reports.View"))
        CustomDrawerMenu(
          icon: Icons.article,
          title: 'Reports',
          children: [
           
            CustomMenuItem(
              title: 'Payments',
              active: activeTab == 'Payments',
              onTap: () {
                GoRouter.of(context).push(AppRouter.paymentsDailyPath);
              },
            ),

            CustomMenuItem(
              title: 'FactoryVsCustDispatch',
              active: activeTab == 'FactoryVsCustDispatch',
              onTap: () {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchHourly);
              },
            ),
            CustomMenuItem(
              title: 'Dispatch Details',
              active: activeTab == 'Dispatch Details',
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.dispatchDetailsPerRegionPath);
              },
            ),
            CustomMenuItem(
              title: 'Export Dispatch Details',
              active: activeTab == 'Export Dispatch Details',
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.exportDispatchPerCustomerPath);
              },
            ),
            (userPos != "Sales Agent")
                ? CustomMenuItem(
                    title: 'Morning Meeting',
                    active: activeTab == 'Morning Meeting',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.morningMeatingPath);
                    },
                  )
                : const SizedBox(),
            CustomMenuItem(
              title: 'Loading Details',
              active: activeTab == 'Loading Details',
              onTap: () {
                GoRouter.of(context).push(AppRouter.loadingDetailsPath);
              },
            ),
            CustomMenuItem(
              title: 'Pending Details',
              active: activeTab == 'Pending Details',
              onTap: () {
                GoRouter.of(context).push(AppRouter.pendingPath);
              },
            ),
          ],
        ),
      ],
    );
  }
}
