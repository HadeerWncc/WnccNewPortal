import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/monthly_payment_table.dart';

class DailyPaymentTablesSection extends StatefulWidget {
  const DailyPaymentTablesSection({
    super.key,
  });

  @override
  State<DailyPaymentTablesSection> createState() =>
      _DailyPaymentTablesSectionState();
}

class _DailyPaymentTablesSectionState extends State<DailyPaymentTablesSection> {
  int activeTab = 0;
  bool openCharts = false;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomChckButtons(
                buttons: const ["EGP", "USD"],
                activeTab: activeTab,
                onTap: (value) {
                  if (value == "EGP") {
                    activeTab = 0;
                  } else {
                    activeTab = 1;
                  }
                  setState(() {});
                }),
            CustomToggleButton(
                onToggle: (value) => setState(() => openCharts = value)),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!openCharts) ...[
                  sectionTitle('Payments Per Bank'),
                  const SizedBox(height: 8),
                ],
                if (openCharts)
                  MonthlyPaymentTable(
                    currency: activeTab == 0 ? "EGP" : "USD",
                    showCharts: openCharts,
                  )
                else
                  SizedBox(
                    height: orientation == Orientation.landscape ? 400 : 600,
                    child: MonthlyPaymentTable(
                      currency: activeTab == 0 ? "EGP" : "USD",
                      showCharts: openCharts,
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
