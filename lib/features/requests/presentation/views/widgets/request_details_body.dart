import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/close_request_action_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/contact_person_info_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/custom_request_action_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/followup_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_for_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_details_header.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_details_info.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_replies_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_type_item_list.dart';

class RequestDetailsBody extends StatelessWidget {
  const RequestDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomRequestActionSection(),
          Divider(),
          CloseRequestActionSection(),
          RequestDetailsHeader(),
          ContactPersonInfoSection(),
          RequestDetailsInfo(),
          SizedBox(height: 10),
          DividerLine(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: RequestTypeItemList(
              requestTypes: [
                'Invoice',
                'Account Statement',
                'Dispatch Report',
              ],
            ),
          ),
          FollowUpSection(),
          ForwardedForSection(),
          RequestRepliesSection(),
        ],
      ),
    );
  }
}