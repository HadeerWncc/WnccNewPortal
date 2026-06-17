import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/priority/summary/presentation/managers/cubites/summary_priority_cubit/summary_priority_cubit.dart';
import 'package:wncc_portal/features/priority/summary/presentation/views/widgets/priority_summary_header.dart';
import 'package:wncc_portal/features/priority/summary/presentation/views/widgets/summary_priority_tables_body.dart';
import 'package:wncc_portal/core/widgets/custom_chck_buttons.dart';

class PrioritySymmaryBody extends StatefulWidget {
  const PrioritySymmaryBody({super.key});

  @override
  State<PrioritySymmaryBody> createState() => _PrioritySymmaryBodyState();
}

class _PrioritySymmaryBodyState extends State<PrioritySymmaryBody> {
  int activeTab = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SummaryPriorityCubit>(context)
        .getPrioritySummary(DateTime.now(), DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrioritySummaryHeader(),
        const SizedBox(height: 7),
        CustomChckButtons(
          buttons: const ["Bags", "Bulk"],
          activeTab: activeTab,
          onTap: (value) {
            setState(() {
              activeTab = value == "Bags" ? 0 : 1;
            });
          },
        ),
        const SizedBox(height: 10),
        SummaryPriorityTablesBody(activeTab: activeTab),
      ],
    );
  }
}
