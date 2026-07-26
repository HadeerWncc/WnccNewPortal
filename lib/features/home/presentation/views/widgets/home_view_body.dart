import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/features/home/data/models/home/quota.summary.model.dart';
import 'package:wncc_portal/features/home/presentation/manager/cubites/home_cubit/home_cubit.dart';
import 'package:wncc_portal/features/home/presentation/manager/helper/get_total_home_summary.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/box_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/priority_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/quota_filter.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/quota_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          Quota quota = mergeQuotas(
              state.homeSummary.salesData!.map((e) => e.quota!).toList());
          Quota priority = mergeQuotas(
              state.homeSummary.salesData!.map((e) => e.priority!).toList());
          Quota dispatch = mergeQuotas(
              state.homeSummary.salesData!.map((e) => e.dispatch!).toList());
          Quota pending = mergeQuotas(
              state.homeSummary.salesData!.map((e) => e.pending!).toList());
          Quota checked = mergeQuotas(
              state.homeSummary.salesData!.map((e) => e.checked!).toList());
          Quota loading = mergeQuotas(
              state.homeSummary.salesData!.map((e) => e.loading!).toList());
          num dailyAmount = mergeNums(state.homeSummary.salesData!
              .map((e) => e.dailyPayment!)
              .toList());
          num monthlyAmount = mergeNums(state.homeSummary.salesData!
              .map((e) => e.monthlyPayment!)
              .toList());
          num paymentCount = mergeNums(state.homeSummary.salesData!
              .map((e) => e.dailyPaymentCount!)
              .toList());
          return SingleChildScrollView(
            child: Column(
              children: [
                const HomeUserCard(
                  gradient: [
                    Color(0xff001245),
                    Color.fromARGB(255, 4, 26, 85),
                  ],
                  child: QuotaFilter(
                      // mode: 0,
                      // user: user,
                      // quota: (state.bagsPrioritySummary[0].totalQuota +
                      //     state.bulkPrioritySummary[0].totalQuota),
                      // priority: (state.bagsPrioritySummary[0].totalPriority +
                      //     state.bulkPrioritySummary[0].totalPriority),
                      ),
                ),
                const SizedBox(height: 10),
                HomeUserCard(
                  gradient: const [
                    Color.fromARGB(255, 222, 224, 231),
                    Color.fromARGB(255, 218, 222, 232),
                  ],
                  child: QuotaSummarySection(
                    priority: priority,
                    quota: quota,
                  ),
                ),
                HomeUserCard(
                  gradient: const [
                    Color(0xff001245),
                    Color.fromARGB(255, 4, 26, 85),
                  ],
                  child: PrioritySummarySection(
                    dispatchDate: dispatch,
                    pendingDate: pending,
                  ),
                ),
                HomeUserCard(
                  gradient: [
                    Color.fromARGB(255, 222, 224, 231),
                    Color.fromARGB(255, 218, 222, 232),
                  ],
                  child: BoxSummarySection(
                    title: 'Loading Summary',
                    subTitle: 'Checked in and Loading Factory',
                    title1: 'Checked-in Quantity',
                    value1: formatNum((checked.delivery!.total ?? 0) +
                        (checked.pickup!.total ?? 0)),
                    title2: 'Loading Quantity',
                    value2: formatNum((loading.delivery!.total ?? 0) +
                        (loading.pickup!.total ?? 0)),
                    title3: 'Loading Truck',
                    value3: '18',
                  ),
                ),
                HomeUserCard(
                  gradient: const [
                    Color.fromARGB(255, 222, 224, 231),
                    Color.fromARGB(255, 218, 222, 232),
                  ],
                  child: BoxSummarySection(
                    title: 'Payments Summary',
                    subTitle: 'Checked in and Loading Factory',
                    title1: 'Daily Amount',
                    value1: formatNum(dailyAmount),
                    title2: 'Monthly Amount',
                    value2: formatNum(monthlyAmount),
                    title3: 'Monthly Payment Count',
                    value3: formatNum(paymentCount),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
    // : const SizedBox();
  }
}
