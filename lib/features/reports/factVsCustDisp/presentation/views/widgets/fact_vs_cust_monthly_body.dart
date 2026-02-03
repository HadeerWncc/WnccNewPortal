import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/monthly_body.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/monthly_header.dart';

class FactvscustpageMonthlyBody extends StatelessWidget {
  const FactvscustpageMonthlyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          MonthlyHeader(),
          SizedBox(height: 16),
          Expanded(child: MonthlyBody()),
        ],
      ),
    );
  }
}
