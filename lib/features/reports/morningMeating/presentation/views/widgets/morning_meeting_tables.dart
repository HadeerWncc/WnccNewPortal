import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/section_title.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/cubites/cubit/morning_meeting_cubit.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/views/widgets/customer_dispatch_table.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/views/widgets/factory_dispatch_table.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/views/widgets/loading/loading_morning_meeting.dart';

class MorningMeetingTables extends StatelessWidget {
  const MorningMeetingTables({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: BlocBuilder<MorningMeetingCubit, MorningMeetingState>(
          builder: (context, state) {
            if (state is MorningMeetingSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('Factory (FLS)'),
                  const SizedBox(height: 8),
                  FactoryDispatchTable(
                      factoryDispatchResponse: state.factoryEntity),
                  const SizedBox(height: 30),
                  sectionTitle('Customer (P&L)'),
                  const SizedBox(height: 8),
                  CustomerDispatchTable(
                    customerDispatchResponse: state.customerDispatchEntity,
                  )
                ],
              );
            } else if (state is MorningMeetingFailure) {
              return Center(
                  child: Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ));
            } else {
              return const LoadingMorningMeeting();
            }
          },
        ),
      ),
    );
  }
}
