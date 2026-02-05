import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/customer_drawer_menu.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/customer_menu_item.dart';

class DrawerMenuList extends StatelessWidget {
  const DrawerMenuList({
    super.key,
    required this.activeTab,
  });
  final String activeTab;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        // CustomDrawerMenu(
        //   expanded: true,
        //   icon: Icons.star,
        //   iconColor: Colors.amber,
        //   title: 'Favourite List',
        //   children: [
        //     CustomMenuItem(
        //       title: 'Sales Quota',
        //       active: activeTab == 'Sales Quota',
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.salesQuotaPath);
        //       },
        //     ),
        //     CustomMenuItem(
        //       title: 'Delivery',
        //       active: activeTab == 'Delivery',
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.deliveryPath);
        //       },
        //     ),
        //     CustomMenuItem(
        //       title: 'PickUp',
        //       active: activeTab == 'PickUp',
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.pickupPath);
        //       },
        //     ),
        //   ],
        // ),
        // const Divider(),
        // CustomDrawerMenu(
        //   icon: Icons.keyboard_double_arrow_up,
        //   title: 'Priority',
        //   children: [
        //     CustomMenuItem(
        //       title: 'Sales Quota',
        //       active: activeTab == 'Sales Quota',
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.salesQuotaPath);
        //       },
        //     ),
        //     CustomMenuItem(
        //       title: 'Delivery',
        //       active: activeTab == 'Delivery',
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.deliveryPath);
        //       },
        //     ),
        //     CustomMenuItem(
        //       title: 'PickUp',
        //       active: activeTab == 'PickUp',
        //       onTap: () {
        //         GoRouter.of(context).push(AppRouter.pickupPath);
        //       },
        //     ),
        //   ],
        // ),
        CustomMenuItem(
          title: 'Home',
          active: activeTab == 'Home',
          onTap: () {
            GoRouter.of(context).push(AppRouter.homePath);
          },
        ),
        CustomDrawerMenu(
          icon: Icons.analytics,
          title: 'Reports',
          children: [
            CustomMenuItem(
              title: 'FactoryVsCustDispatch',
              active: activeTab == 'FactoryVsCustDispatch',
              onTap: () {
                GoRouter.of(context).push(AppRouter.factVsCustDispatchHourly);
              },
            ),
            CustomMenuItem(
              title: 'Morning Meeting',
              active: activeTab == 'Morning Meeting',
              onTap: () {
                GoRouter.of(context).push(AppRouter.morningMeatingPath);
              },
            ),
             CustomMenuItem(
              title: 'Payments',
              active: activeTab == 'Payments',
              onTap: () {
                GoRouter.of(context).push(AppRouter.paymentsPath);
              },
            ),
          ],
        ),
      ],
    );
  }
}
