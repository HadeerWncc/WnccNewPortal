import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/format_num.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/dispatch_home_card.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/dispatch_today_circular_chart.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/item_home_card.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/quota_card_contant.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/today_info.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/user_quota_card.dart';
import 'package:wncc_portal/features/priority/summary/presentation/managers/cubites/summary_priority_cubit/summary_priority_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return
        // ((user.position == 'Sales Agent') ||
        //         (user.position == 'Sales Area Manager'))
        //     ?
        BlocBuilder<SummaryPriorityCubit, SummaryPriorityState>(
      builder: (context, state) {
        if (state is SummaryPrioritySuccess) {
          return Column(
            children: [
              HomeUserCard(
                child: QuotaCardContant(
                  user: user,
                  quota: (state.bagsPrioritySummary[0].totalQuota +
                      state.bulkPrioritySummary[0].totalQuota),
                  priority: (state.bagsPrioritySummary[0].totalPriority +
                      state.bulkPrioritySummary[0].totalPriority),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemHomeCard(
                    title: 'Priority',
                    value: formatNum(
                        state.bagsPrioritySummary[0].totalPriority +
                            state.bulkPrioritySummary[0].totalPriority),
                  ),
                  DispatchHomeCard(
                    value: formatNum(
                        state.bagsPrioritySummary[0].totalDispatch +
                            state.bulkPrioritySummary[0].totalDispatch),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemHomeCard(
                    title: 'Remaining',
                    value: formatNum(
                      (state.bagsPrioritySummary[0].totalPriority +
                              state.bulkPrioritySummary[0].totalPriority) -
                          (state.bagsPrioritySummary[0].totalDispatch +
                              state.bulkPrioritySummary[0].totalDispatch),
                    ),
                  ),
                  const ItemHomeCard(
                    title: 'Pending',
                    value: '...',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              HomeUserCard(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DispatchedTodayCircularChart(
                    dispatchPricentage: formatNum(((state
                                    .bagsPrioritySummary[0].totalDispatch +
                                state.bulkPrioritySummary[0].totalDispatch) /
                            (state.bagsPrioritySummary[0].totalPriority +
                                state.bulkPrioritySummary[0].totalPriority)) *
                        100),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Activity',
                              style: TextStyle(
                                color: homeColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(255, 139, 243, 184),
                                  homeColor,
                                ],
                              ).createShader(bounds),
                              child: const Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: homeColor,
                          thickness: .5,
                        ),
                        const TodayInfo(title: '' //Priotity Updated,
                            ),
                        const TodayInfo(title: '' //Dispatch #204 completed,
                            ),
                        const TodayInfo(title: '' //Quota reached 75%,
                            )
                      ],
                    ),
                  )
                ],
              )),
              const HomeUserCard(
                child: Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.orange,
                      size: 30,
                    ),
                    Text(
                      'Great job!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 221, 174, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "You're close to today's target",
                      style: TextStyle(
                          // color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.pickupPath);
                    },
                    child: const HomeUserCard(
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color: kBtnColor,
                            size: 30.0,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Pickup',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.deliveryPath);
                    },
                    child: const HomeUserCard(
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color: kBtnColor,
                            size: 30.0,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Delivery',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRouter.prioritySummaryPath);
                    },
                    child: const HomeUserCard(
                      child: Row(
                        children: [
                          Icon(
                            Icons.view_column,
                            color: kBtnColor,
                            size: 30.0,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }
        return SizedBox();
      },
    );
    // : const SizedBox();
  }
}
