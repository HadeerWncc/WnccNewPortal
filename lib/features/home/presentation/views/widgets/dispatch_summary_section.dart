import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/month_dispatch.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/dispatch_chart.dart';

class DispatchSummarySection extends StatelessWidget {
  const DispatchSummarySection({super.key, required this.chartData, required this.incoterm});
   final List<MonthDispatch> chartData;
   final List<String> incoterm;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
          'Monthly Dispatch',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
            CustomButtonWithIcon(
              child: "Dispatch Details",
              bgColor: const Color(0xff06a0f5),
              onHoverColor: const Color.fromARGB(255, 4, 106, 161),
              textColor: Colors.white,
              onTap: (){
                GoRouter.of(context).push(AppRouter.dispatchDetailsPerRegionPath);
              },
            )
          ],
        ),
        
        const SizedBox(height: 5),
        const Opacity(
          opacity: .5,
          child: Text(
            'Monthly Dispatch data overview last 5 months',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        DispatchChart(
          data: chartData,
          incoterm: incoterm,
        )
      ],
    );
 
  }
}