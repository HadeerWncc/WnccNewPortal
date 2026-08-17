import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/quota.dart';
import 'package:wncc_portal/features/home/presentation/manager/helper/methods.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/bags_bulk_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';

class QuotaSummarySection extends StatelessWidget {
  const QuotaSummarySection({
    super.key,
    required this.priority,
    required this.quota,
    required this.incotermList,
  });
  final Quota priority;
  final Quota quota;
  final List<String> incotermList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quota Summary',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 5),
        const Opacity(
          opacity: .5,
          child: Text(
            'Quota and Priority Summary',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeUserCard(
              height: MediaQuery.of(context).size.height * .19,
              margin: const EdgeInsets.all(0),
              gradient: const [
                Color.fromARGB(255, 222, 224, 231),
                Color.fromARGB(255, 218, 222, 232),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatNum(
                            getQuotaValue(quota, incotermList).total ?? 0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Total Quota Quantity',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .33,
                        child: LinearPercentIndicator(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          lineHeight: 3,
                          percent: ((getQuotaValue(priority, incotermList)
                                              .total ??
                                          0) /
                                      (getQuotaValue(quota, incotermList)
                                              .total ??
                                          0)) >
                                  1
                              ? 1
                              : (getQuotaValue(priority, incotermList).total ??
                                      0) /
                                  (getQuotaValue(quota, incotermList).total ??
                                      0),
                          barRadius: const Radius.circular(20),
                          backgroundColor: homeColor,
                          progressColor: const Color.fromARGB(255, 18, 177, 87),
                          animation: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${formatNum(getQuotaValue(priority, incotermList).total ?? 0)}/${formatNum(getQuotaValue(quota, incotermList).total ?? 0)} completed . ${parseToInt(formatNum(((getQuotaValue(priority, incotermList).total ?? 0) / (getQuotaValue(quota, incotermList).total ?? 0)) * 100))}%',
                        style: const TextStyle(
                          color: homeColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
              ),
            ),
            // const SizedBox(width: 10),
            HomeUserCard(
              height: MediaQuery.of(context).size.height * .19,
              margin: const EdgeInsets.all(0),
              gradient: const [
                Color.fromARGB(255, 222, 224, 231),
                Color.fromARGB(255, 218, 222, 232),
              ],
              child: BagsBulkSection(
                mode: 1,
                title: 'Priority Quantity',
                value: getQuotaValue(priority, incotermList).total ?? 0,
                doughnutChartValues: {
                  'Bags': getQuotaValue(priority, incotermList).bags ?? 0,
                  'Bulk': getQuotaValue(priority, incotermList).bulk ?? 0,
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
