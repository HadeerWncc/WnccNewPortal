import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/select_routing_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/select_startup_routing_action.dart';

class SelectStartupRoutingBody extends StatelessWidget {
  const SelectStartupRoutingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const FormHeading(
            title: 'Select Startup Routing',
            subTitle: 'Change your startup page.',
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: const [
                SelectRoutingItem(
                  pageName: 'Home',
                  active: true,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Sales Quota',
                  active: false,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Daily summary',
                  active: false,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Pending orders',
                  active: false,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Customer Service',
                  active: false,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Ranking',
                  active: false,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Export',
                  active: false,
                ),
                SizedBox(height: 12),
                SelectRoutingItem(
                  pageName: 'Payments',
                  active: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const SelectStartupRoutingAction(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
