import 'package:flutter/material.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/quota.dart';
import 'package:wncc_portal/features/home/presentation/manager/helper/methods.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/bags_bulk_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';

class PrioritySummarySection extends StatelessWidget {
  const PrioritySummarySection({
    super.key,
    required this.dispatchDate,
    required this.pendingDate,
    required this.incoterm,
  });
  final Quota dispatchDate;
  final Quota pendingDate;
  final List<String> incoterm;
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
                value: getQuotaValue(dispatchDate, incoterm).total ?? 0,
                doughnutChartValues: {
                  'Bags': getQuotaValue(dispatchDate, incoterm).bags ?? 0,
                  'Bulk': getQuotaValue(dispatchDate, incoterm).bulk ?? 0,
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
                value: getQuotaValue(pendingDate, incoterm).total ?? 0,
                doughnutChartValues: {
                  'Bags': getQuotaValue(pendingDate, incoterm).bags ?? 0,
                  'Bulk': getQuotaValue(pendingDate, incoterm).bulk ?? 0,
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
