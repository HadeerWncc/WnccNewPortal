import 'package:flutter/material.dart';
import 'package:wncc_portal/features/booking_price/presentation/views/widgets/booking_price_main_data.dart';

class BookingPriceBody extends StatelessWidget {
  const BookingPriceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const BookingPriceMainData(),
        )
      ],
    );
  }
}
