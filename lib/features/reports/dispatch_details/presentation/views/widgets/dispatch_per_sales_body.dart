import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_buttons_list.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_per_sales_table_body.dart';

class DispatchPerSalesBody extends StatelessWidget {
  const DispatchPerSalesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          DispatchDetailsButtonsList(activeTab: 1),
          SizedBox(height: 8),
          DispatchPerSalesTableBody(),
        ],
      ),
    );
  }
}
