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

class _DailyPaymentTablesSectionState
    extends State<DailyPaymentTablesSection> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
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
            CustomToggleButton(onToggle: (value) {}),
          ],
        ),
        const SizedBox(height: 10),
        sectionTitle('Payments Per Bank'),
        const SizedBox(height: 8),
        MonthlyPaymentTable(
          currency: activeTab == 0 ? "EGP" : "USD",
        ),
      ],
    );
  }
}