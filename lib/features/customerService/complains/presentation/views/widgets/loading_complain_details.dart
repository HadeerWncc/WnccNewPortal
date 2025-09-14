import 'package:flutter/material.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/complain_actions_section_loading.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/loading_complain_details_header.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/loading_complain_followup_section.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/loading_complain_status.dart';
import 'package:wncc_portal/features/customerService/core/widgets/contact_person_info_loading_section.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_chat.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_divider_line.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_forwarded_for_section.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_support_details_info.dart';

class LoadingComplainDetails extends StatelessWidget {
  const LoadingComplainDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ComplainActionsSectionLoading(),
          Divider(),
          LoadingComplainStatus(),
          LoadingComplainDetailsHeader(),
          ContactPersonInfoLoadingSection(),
          LoadingSupportDetailsInfo(),
          SizedBox(height: 10),
          LoadingDividerLine(),
          SizedBox(height: 10),
          LoadingComplainFollowupSection(),
          LoadingForwardedForSection(),
          LoadingChat(),
        ],
      ),
    );
  }
}
