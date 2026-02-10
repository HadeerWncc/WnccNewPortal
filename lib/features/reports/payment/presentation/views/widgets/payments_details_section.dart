import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/details_payment_table.dart';

class PaymentsDetailsSection extends StatefulWidget {
  const PaymentsDetailsSection({super.key});

  @override
  State<PaymentsDetailsSection> createState() => _PaymentsDetailsSectionState();
}

class _PaymentsDetailsSectionState extends State<PaymentsDetailsSection> {
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
    
        Expanded(
          child: DetailsPaymentTable(
            currency: activeTab == 0 ? "EGP" : "USD",
          ),
        ),
      ],
    );
  }
}
