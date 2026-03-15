import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_toggle_button.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/customer_payment_header.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/customer_payment_table.dart';

class CustomerPaymentTablesSection extends StatefulWidget {
  const CustomerPaymentTablesSection({
    super.key,
  });

  @override
  State<CustomerPaymentTablesSection> createState() =>
      _CustomerPaymentTablesSectionState();
}

class _CustomerPaymentTablesSectionState
    extends State<CustomerPaymentTablesSection> {
  int activeTab = 0;
  bool openCharts = false;
  String selectedSales = "All";
  String? selectedPayer = "All";

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            CustomerPaymentHeader(
              onChangePayer: (value) {
                selectedPayer = value;
                setState(() {
                  
                });
              },
            ),
            const SizedBox(width: 7),
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
            const SizedBox(width: 7),
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
                  sectionTitle('Payments Per Customer'),
                  const SizedBox(height: 8),
                ],
                if (openCharts)
                  CustomerPaymentTable(
                    currency: activeTab == 0 ? "EGP" : "USD",
                    showCharts: openCharts,
                    payerId: selectedPayer,
                  )
                else
                  SizedBox(
                    height: orientation == Orientation.landscape ? 400 : 600,
                    child: CustomerPaymentTable(
                      currency: activeTab == 0 ? "EGP" : "USD",
                      showCharts: openCharts,
                      payerId: selectedPayer,
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
