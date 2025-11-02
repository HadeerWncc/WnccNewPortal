import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/booking_price_action_buttons.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/booking_price_charts.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/payer_distribution_table.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/region_distribution_table.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/booking_price_summary.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/filter_part_body.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/product_price_content.dart';

class BookingPriceMainData extends StatelessWidget {
  const BookingPriceMainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        FilterPartBody(),
        const SizedBox(height: 20),
        const DividerLine(),
        BookingPriceSummary(),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        ProductPriceContent(),
        const SizedBox(height: 10),
        RegionDistributionTable(),
        const SizedBox(height: 30),
        PayerDistributionTable(),
        BookingPriceActionButtons(),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        BookingPriceCharts(),
        const SizedBox(height: 20),
      ],
    );
  }
}

// class PriceData {
//   PriceData(this.date, this.pickup, this.delivery);
//   final DateTime date;
//   final double pickup;
//   final double delivery;
// }
