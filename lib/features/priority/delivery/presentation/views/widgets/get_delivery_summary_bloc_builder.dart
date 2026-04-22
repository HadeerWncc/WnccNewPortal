import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/comm/widgets/priority_summary.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_delivery_summary_cubit/get_delivery_summary_cubit.dart';

class GetDeliverySummaryBlocBuilder extends StatelessWidget {
  const GetDeliverySummaryBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeliverySummaryCubit, GetDeliverySummaryState>(
      builder: (context, state) {
        if (state is GetDeliverySummarySuccess) {
          return PrioritySummary(
            prioritySummary: state.prioritySummaryModel,
          );
        } else {
          return Text("...loading");
        }
      },
    );
  }
}
