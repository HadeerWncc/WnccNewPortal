import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_selected_tabs.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_orders_page.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/pending_delivery_order_page.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/priority_delivery_order_page.dart';

class DeliveryMainData extends StatefulWidget {
  const DeliveryMainData({super.key, required this.user});
  final UserModel user;
  @override
  State<DeliveryMainData> createState() => _DeliveryMainDataState();
}

class _DeliveryMainDataState extends State<DeliveryMainData> {
  String selectedTab = 'Pending';
  String currentDate = DateTime.now().toString();
  // @override
  // void initState() {
  //   if (widget.user.position == "Dispatcher") {
  //     selectedTab = "Priority";
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // const PageHeader(
        //   title: 'Delivery',
        //   icon: Symbols.weight,
        // ),
        // const SizedBox(height: 10),
        CustemSelectedTabs(
          user: widget.user,
          onChangeTab: (value) {
            setState(() {
              selectedTab = value;
            });
          },
        ),
        const SizedBox(height: 10),
        if (selectedTab == 'Pending' &&
            widget.user.position != "Dispatch Coordinator")
          const PendingDeliveryOrdersPage()
        else if (selectedTab == 'Dispatched')
          DispatchDeliveryOrdersPage(
            user: widget.user,
          )
        else
          PriorityDeliveryOrderPage(
            user: widget.user,
          )
      ],
    );
  }
}
