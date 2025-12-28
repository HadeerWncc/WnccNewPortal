import 'package:flutter/material.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/multi_priod_table.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/payer_prices_table.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/rows_prices_table.dart';

class PricingReportTables extends StatelessWidget {
  const PricingReportTables({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RowsPricesTable(),
        SizedBox(height: 40),
        MultiPeriodTable(),
        SizedBox(height: 40),
        PayerPricesTable(),
      ],
    );
  }
}
