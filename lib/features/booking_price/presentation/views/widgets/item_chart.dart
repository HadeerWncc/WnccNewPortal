import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/chart_data.dart';

class ItemChart extends StatelessWidget {
  const ItemChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const BookingPriceChartData(),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: SfSparkLineChart(
                    color: Colors.blue,
                    data: [0, 100,   100],
                    axisLineWidth: 0,
                    marker: null,
                  ),
                ),
                // const SizedBox(height: 5),
                SizedBox(
                  height: 40,
                  child: SfSparkLineChart(
                    color: Colors.red,
                    data: [0, 140, 140],
                    axisLineWidth: 0,
                    marker: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}