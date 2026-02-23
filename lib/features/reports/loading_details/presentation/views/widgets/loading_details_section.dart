import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/manager/loading_details_cubit/loading_details_cubit.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_details_summary.dart';
import 'package:wncc_portal/features/reports/loading_details/presentation/views/widgets/loading_table_with_filter.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/custom_chck_buttons.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/loading/payment_loaing.dart';

class LoadingDetailsSection extends StatelessWidget {
  const LoadingDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<LoadingDetailsCubit, LoadingDetailsState>(
      builder: (context, state) {
        if (state is LoadingDetailsSuccess) {
          final cubit = context.read<LoadingDetailsCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ===== Summary =====
              LoadingDetailsSummary(
                loadingDetailsSummaryEntity: state.summary,
              ),
              const SizedBox(height: 7),

              /// ===== Tabs =====
              CustomChckButtons(
                buttons: const ["Check In", "Loading", "Both"],
                activeTab: state.activeTab,
                onTap: (value) {
                  if (value == "Check In") {
                    cubit.changeTab(0);
                  } else if (value == "Loading") {
                    cubit.changeTab(1);
                  } else {
                    cubit.changeTab(2);
                  }
                },
              ),
              const SizedBox(height: 10),

              /// ===== Filters & Table =====
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: orientation == Orientation.landscape ? 400 : 600,
                    child: LoadingDetailsTableWithFilter(
                      tableData: state.loadingDetails,
                      allData: cubit.allData, // لإظهار كل العناصر في dropdown
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        if (state is LoadingDetailsFailure) {
          return Center(child: Text(state.errorMsg));
        }

        return const PaymentLoaing();
      },
    );
  }
}
