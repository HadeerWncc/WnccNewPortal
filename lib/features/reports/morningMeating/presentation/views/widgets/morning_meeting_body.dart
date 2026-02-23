import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/cubites/dispatch_cubit/morning_meeting_cubit.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/cubites/morning_meeting_priority_cubit/morning_meeting_priority_cubit.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/views/widgets/morning_meeting_header.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/views/widgets/morning_meeting_tables.dart';

class MorningMeetingBody extends StatelessWidget {
  const MorningMeetingBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MorningMeetingCubit>(context)
        .getMorningMeetingData(DateTime.now());
    BlocProvider.of<MorningMeetingPriorityCubit>(context)
        .getMorningMeetingPriority(DateTime.now());
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          MorningMeetingHeader(),
          SizedBox(height: 16),
          Expanded(child: MorningMeetingTables()),
        ],
      ),
    );
  }
}
