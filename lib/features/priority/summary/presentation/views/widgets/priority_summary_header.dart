import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/custom_range_date_picker.dart';
import 'package:wncc_portal/features/priority/summary/presentation/managers/cubites/summary_priority_cubit/summary_priority_cubit.dart';

class PrioritySummaryHeader extends StatefulWidget {
  const PrioritySummaryHeader({super.key});

  @override
  State<PrioritySummaryHeader> createState() => _PaymentsDetailsHeaderState();
}

class _PaymentsDetailsHeaderState extends State<PrioritySummaryHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: (MediaQuery.of(context).orientation == Orientation.landscape)
            ? MediaQuery.of(context).size.width * .4
            : MediaQuery.of(context).size.width * .9,
        child: CustomRangeDatePicker(
          title: 'Select Date Range',
          onChange: (value) {
            BlocProvider.of<SummaryPriorityCubit>(context)
                .getPrioritySummary(value.start, value.end);
          },
        ),
      ),
    );
  }
}
