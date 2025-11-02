import 'package:flutter/material.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/item_chart.dart';

class BookingPriceCharts extends StatelessWidget {
  const BookingPriceCharts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemChart(),
        SizedBox(height: 10),
        ItemChart(),
        SizedBox(height: 10),
        ItemChart(),
      ],
    );
  }
}
