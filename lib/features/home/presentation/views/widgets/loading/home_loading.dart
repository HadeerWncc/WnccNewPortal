import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/quota.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/box_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/priority_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/quota_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var quota = const Quota(
        delivery: DispatchDetailsQuantity(
          bags: 0,
          bulk: 0,
          total: 0,
        ),
        pickup: DispatchDetailsQuantity(
          bags: 0,
          bulk: 0,
          total: 0,
        ));
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(children: [
          HomeUserCard(
            gradient: const [
              Color.fromARGB(255, 222, 224, 231),
              Color.fromARGB(255, 218, 222, 232),
            ],
            child: QuotaSummarySection(
              priority: quota,
              quota: quota,
              incotermList: [],
            ),
          ),
          HomeUserCard(
            gradient: const [
              Color(0xff001245),
              Color.fromARGB(255, 4, 26, 85),
            ],
            child: PrioritySummarySection(
              dispatchDate: quota,
              pendingDate: quota,
              incoterm: [],
            ),
          ),
          // HomeUserCard(
          //   gradient: const [
          //     Color.fromARGB(255, 222, 224, 231),
          //     Color.fromARGB(255, 218, 222, 232),
          //   ],
          //   child: DispatchSummarySection(
          //     chartData: [],
          //     incoterm: [],
          //   ),
          // ),
          HomeUserCard(
            gradient: const [
              Color.fromARGB(255, 222, 224, 231),
              Color.fromARGB(255, 218, 222, 232),
            ],
            child: BoxSummarySection(
              title: 'Loading Summary',
              subTitle: 'Checked in and Loading Factory',
              title1: 'Checked-in Quantity',
              value1: formatNum(0),
              title2: 'Loading Quantity',
              value2: formatNum(0),
              title3: 'Loading Truck',
              value3: formatNum(0),
            ),
          ),
          // HomeUserCard(
          //   gradient: const [
          //     Color.fromARGB(255, 222, 224, 231),
          //     Color.fromARGB(255, 218, 222, 232),
          //   ],
          //   child: BoxPaymentSummarySection(
          //     title: 'Payments Summary',
          //     subTitle: 'Real_time payment overview',
          //     payments: [],
          //   ),
          // ),
          const SizedBox(height: 20),
        ]));
  }
}
