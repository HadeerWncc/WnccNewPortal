import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/daily_body.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/daily_header.dart';

class FactvscustpageDailyBody extends StatelessWidget {
  const FactvscustpageDailyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          DailyHeader(),
          SizedBox(height: 16),
          Expanded(child: DailyBody()),
        ],
      ),
    );
  }
}
