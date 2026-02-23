import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/date_picker.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/cubites/dispatch_cubit/morning_meeting_cubit.dart';

class MorningMeetingHeader extends StatelessWidget {
  const MorningMeetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DatePicker(
        title: 'Select Date',
        onChange: (value) {
          BlocProvider.of<MorningMeetingCubit>(context)
              .getMorningMeetingData(value);
        },
      ),
    );
  }
}
