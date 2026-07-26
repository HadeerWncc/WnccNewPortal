import 'package:flutter/material.dart';
import 'package:wncc_portal/features/home/data/models/home/quota.summary.model.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/bags_bulk_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';

class PrioritySummarySection extends StatelessWidget {
  const PrioritySummarySection({
    super.key,
    required this.dispatchDate, required this.pendingDate,
  });
  final Quota dispatchDate;
  final Quota pendingDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeUserCard(
              shadow: false,
              height: MediaQuery.of(context).size.height * .19,
              margin: const EdgeInsets.all(0),
              gradient: const [
                Color.fromARGB(255, 1, 24, 86),
                Color.fromARGB(255, 3, 28, 94),
              ],
              child: BagsBulkSection(
                mode: 0,
                title: 'Dispatch Quantity',
                value: (dispatchDate.pickup!.total ?? 0) +
                      (dispatchDate.delivery!.total ?? 0),
                doughnutChartValues: {
                  'Bags': (dispatchDate.pickup!.bags ?? 0) +
                      (dispatchDate.delivery!.bags ?? 0),
                  'Bulk': (dispatchDate.pickup!.bulk ?? 0) +
                      (dispatchDate.delivery!.bulk ?? 0),
                },
              ),
            ),
            // const SizedBox(width: 10),
            HomeUserCard(
              shadow: false,
              height: MediaQuery.of(context).size.height * .19,
              margin: const EdgeInsets.all(0),
              gradient: const [
                Color.fromARGB(255, 1, 24, 86),
                Color.fromARGB(255, 3, 28, 94),
              ],
              child: BagsBulkSection(
                mode: 0,
                title: 'Pending Quantity',
                value: (pendingDate.pickup!.total ?? 0) +
                      (pendingDate.delivery!.total ?? 0),
                doughnutChartValues: {
                  'Bags': (pendingDate.pickup!.bags ?? 0) +
                      (pendingDate.delivery!.bags ?? 0),
                  'Bulk': (pendingDate.pickup!.bulk ?? 0) +
                      (pendingDate.delivery!.bulk ?? 0),
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
