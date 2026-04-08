import 'package:flutter/widgets.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_selected_tabs.dart';
import 'dispatch_pickup/dispatch_pickup_orders_page.dart';
import 'pending_pickup/pending_pickup_orders_page.dart';
import 'priority_pickup/priority_pickup_orders_page.dart';

class PickupMainData extends StatefulWidget {
  const PickupMainData({super.key, required this.user});
  final UserModel user;
  @override
  State<PickupMainData> createState() => _PickupMainDataState();
}

class _PickupMainDataState extends State<PickupMainData> {
  String selectedTab = 'Pending';
  String currentDate = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustemSelectedTabs(
          onChangeTab: (value) {
            setState(() {
              selectedTab = value;
            });
          },
          user: widget.user,
        ),
        const SizedBox(height: 10),
        if (selectedTab == 'Pending')
          const PendingPickupOrdersPage()
        else if (selectedTab == 'Priority')
          const PriorityPickupOrdersPage()
        else
          const DispatchPickupOrdersPage()
      ],
    );
  }
}
