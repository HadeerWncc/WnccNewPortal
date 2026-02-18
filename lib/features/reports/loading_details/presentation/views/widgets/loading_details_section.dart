import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_details_summary.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_details_table.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';

class LoadingDetailsSection extends StatefulWidget {
  const LoadingDetailsSection({
    super.key,
  });

  @override
  State<LoadingDetailsSection> createState() =>
      _LoadingDetailsSectionState();
}

class _LoadingDetailsSectionState extends State<LoadingDetailsSection> {
  int activeTab = 2;
  // bool openCharts = false;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const LoadingDetailsSummary(),
            const SizedBox(height: 7),
            CustomChckButtons(
                buttons: const ["Check In", "Loading","Both"],
                activeTab: activeTab,
                onTap: (value) {
                  if (value == "Check In") {
                    activeTab = 0;
                  } else if(value == "Loading") {
                    activeTab = 1;
                  }
                  else{
                    activeTab = 2;
                  }
                  setState(() {});
                }),
            
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                    height: orientation == Orientation.landscape ? 400 : 600,
                    child: LoadingDetailsTable(
                      status: activeTab == 0 ? "Check In" : activeTab == 1? "Loading": "USD",
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
