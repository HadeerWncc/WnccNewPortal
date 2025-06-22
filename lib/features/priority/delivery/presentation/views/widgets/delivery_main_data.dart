import 'package:flutter/material.dart';
import 'package:wncc_portal/features/priority/comm/widgets/custom_selected_tabs.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/dispatch_delivery_orders_page.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/pending_delivey.dart/pending_delivery_order_page.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/priority_delivery.dart/priority_delivery_order_page.dart';

class DeliveryMainData extends StatefulWidget {
  const DeliveryMainData({super.key});
  // final String selectedTab;
  @override
  State<DeliveryMainData> createState() => _DeliveryMainDataState();
}

class _DeliveryMainDataState extends State<DeliveryMainData> {
  String selectedTab = 'Pending';
  String currentDate = DateTime.now().toString();
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
          onChangeTab: (value) {
            setState(() {
              selectedTab = value;
            });
          },
        ),
        const SizedBox(height: 10),
        if (selectedTab == 'Pending')
          const PendingDeliveryOrdersPage()
        else if (selectedTab == 'Priority')
          const PriorityDeliveryOrderPage()
        else
          const DispatchDeliveryOrdersPage()
      ],
    );
  }
}
