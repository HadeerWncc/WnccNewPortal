import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/month_dispatch.dart';
import 'package:wncc_portal/features/home/data/models/home_summary/quota.dart';
import 'package:wncc_portal/features/home/presentation/manager/cubites/home_cubit/home_cubit.dart';
import 'package:wncc_portal/features/home/presentation/manager/helper/get_total_home_summary.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/box_payment_summary.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/box_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/dispatch_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/loading/home_loading.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/priority_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/quota_filter.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/quota_summary_section.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.user});
  final UserModel user;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<String> incoterm = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeUserCard(
            gradient: const [
              Color(0xff001245),
              Color.fromARGB(255, 4, 26, 85),
            ],
            child: QuotaFilter(
              onChangedIncoterm: (values) {
                setState(() {
                  incoterm = values;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                if (state.homeSummary.isEmpty) {
                  return const HomeLoadingWidget();
                }
                Quota quota = mergeQuotas(
                    state.homeSummary.map((e) => e.quota!).toList());
                Quota priority = mergeQuotas(
                    state.homeSummary.map((e) => e.priority!).toList());
                Quota dispatch = mergeQuotas(
                    state.homeSummary.map((e) => e.dispatch!).toList());
                Quota pending = mergeQuotas(
                    state.homeSummary.map((e) => e.pending!).toList());
                num checked = mergeNums(
                    state.homeSummary.map((e) => e.checked!).toList());
                num loading = mergeNums(
                    state.homeSummary.map((e) => e.loading!).toList());
                num loadingCount = mergeNums(
                    state.homeSummary.map((e) => e.shipmentTruck!).toList());
                List<MonthDispatch> monthDispatchData =
                    getTotalMonthDispatches(state.homeSummary);
                return Column(
                  children: [
                    HomeUserCard(
                      gradient: const [
                        Color.fromARGB(255, 222, 224, 231),
                        Color.fromARGB(255, 218, 222, 232),
                      ],
                      child: QuotaSummarySection(
                        priority: priority,
                        quota: quota,
                        incotermList: incoterm,
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
                        incoterm: incoterm,
                      ),
                    ),
                    HomeUserCard(
                      gradient: const [
                        Color.fromARGB(255, 222, 224, 231),
                        Color.fromARGB(255, 218, 222, 232),
                      ],
                      child: DispatchSummarySection(
                        chartData: monthDispatchData,
                        incoterm: incoterm,
                      ),
                    ),
                    HomeUserCard(
                      gradient: const [
                        Color.fromARGB(255, 222, 224, 231),
                        Color.fromARGB(255, 218, 222, 232),
                      ],
                      child: BoxSummarySection(
                        title: 'Loading Summary',
                        subTitle: 'Checked in and Loading Factory',
                        title1: 'Checked-in Quantity',
                        value1: formatNum(checked),
                        title2: 'Loading Quantity',
                        value2: formatNum(loading),
                        title3: 'Loading Truck',
                        value3: formatNum(loadingCount),
                      ),
                    ),
                    HomeUserCard(
                      gradient: const [
                        Color.fromARGB(255, 222, 224, 231),
                        Color.fromARGB(255, 218, 222, 232),
                      ],
                      child: BoxPaymentSummarySection(
                        title: 'Payments Summary',
                        subTitle: 'Real_time payment overview',
                        payments: getPaymentTotal(state.homeSummary),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              } else if (state is HomeFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const HomeLoadingWidget();
            },
          ),
        ],
      ),
    );

    // : const SizedBox();
  }
}
