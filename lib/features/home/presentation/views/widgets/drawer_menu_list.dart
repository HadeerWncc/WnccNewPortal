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
        CustomDrawerMenu(
          expanded: true,
          icon: Icons.star,
          iconColor: Colors.amber,
          title: 'Favourite List',
          children: [
            CustomMenuItem(
              title: 'Sales Quota',
              active: activeTab == 'Sales Quota',
              onTap: () {
                GoRouter.of(context).push(AppRouter.salesQuotaPath);
              },
            ),
            CustomMenuItem(
              title: 'Delivery',
              active: activeTab == 'Delivery',
              onTap: () {
                GoRouter.of(context).push(AppRouter.deliveryPath);
              },
            ),
            CustomMenuItem(
              title: 'PickUp',
              active: activeTab == 'PickUp',
              onTap: () {
                GoRouter.of(context).push(AppRouter.pickupPath);
              },
            ),
          ],
        ),
        const Divider(),
        CustomDrawerMenu(
          icon: Icons.home,
          title: 'Customer Service',
          children: [
            CustomMenuItem(
              title: 'Requests',
              active: activeTab == 'Requests',
              onTap: () {
                GoRouter.of(context).push(AppRouter.requests);
              },
            ),
            CustomMenuItem(
              title: 'Complains',
              active: activeTab == 'Complains',
              onTap: () {
                GoRouter.of(context).push(AppRouter.complains);
              },
            ),
            CustomMenuItem(
              title: 'number 3',
              onTap: () {},
            ),
          ],
        ),
        CustomDrawerMenu(
          icon: Icons.account_balance,
          title: 'Sales',
          children: [
            CustomMenuItem(
              title: "Booking Price",
              onTap: () {
                GoRouter.of(context).push(AppRouter.bookingPrice);
              },
            ),
            CustomMenuItem(
              title: "Pricing Report",
              onTap: () {
                GoRouter.of(context).push(AppRouter.pricingReport);
              },
            ),
            CustomMenuItem(
              title: 'number 3',
              onTap: () {},
            ),
          ],
        ),
        CustomDrawerMenu(
          icon: Icons.work,
          title: 'Reports',
          children: [
            CustomMenuItem(
              title: 'number 1',
              onTap: () {},
            ),
            CustomMenuItem(
              title: 'number 2',
              onTap: () {},
            ),
            CustomMenuItem(
              title: 'number 3',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
