import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/hourly_body.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/hourly_header.dart';

class FactvscustpageHourlyBody extends StatelessWidget {
  const FactvscustpageHourlyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          HourlyHeader(),
          SizedBox(height: 16),
          Expanded(child: HourlyBody()),
        ],
      ),
    );
  }
}
