import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_payment_with_filter.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/customer_payment_header.dart';

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
                setState(() {});
              },
              onChangeActiveTab: (value) {
                activeTab = value;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        if (!openCharts) ...[
          sectionTitle('Payments Per Customer'),
          const SizedBox(height: 3),
        ],
        Expanded(
          child: CustomerPaymentWithFilter(
              openCharts: openCharts,
              activeTab: activeTab,
              selectedPayer: selectedPayer,
              orientation: orientation),
        ),
      ],
    );
  }
}
