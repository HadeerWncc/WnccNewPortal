import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/custom_horizontal_divider.dart';
import 'package:wncc_portal/core/widgets/custom_vertical_divider.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/multi_priod_table.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/payer_prices_table.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/rows_prices_table.dart';
import 'package:wncc_portal/features/priority/comm/widgets/data_column_text.dart';

class PricingReportTables extends StatelessWidget {
  const PricingReportTables({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowsPricesTable(),
        const SizedBox(height: 20),
        MultiPeriodTable(),
        const SizedBox(height: 20),
        PayerPricesTable(),
      ],
    );
  }
}
