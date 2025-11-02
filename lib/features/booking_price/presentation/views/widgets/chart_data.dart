import 'package:flutter/material.dart';

class BookingPriceChartData extends StatelessWidget {
  const BookingPriceChartData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Menia',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Opacity(opacity: .5, child: Text('Last Prices')),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3400 EGP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.red,
                      width: 5,
                      height: 5,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Opacity(opacity: .5, child: Text('Delivery')),
                  ],
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3400 EGP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.blue,
                      width: 5,
                      height: 5,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Opacity(opacity: .5, child: Text('Pickup')),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
