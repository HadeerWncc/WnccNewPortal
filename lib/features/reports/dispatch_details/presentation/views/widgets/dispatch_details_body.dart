import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_details_buttons_list.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/dispatch_per_region_table_body.dart';

class DispatchDetailsBody extends StatelessWidget {
  const DispatchDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          DispatchDetailsButtonsList(activeTab: 0),
          SizedBox(height: 8),
          DispatchPerRegionTablesBody(),
        ],
      ),
    );
  }
}
