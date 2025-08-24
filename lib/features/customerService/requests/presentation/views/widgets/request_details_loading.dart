import 'package:flutter/material.dart';
import 'package:wncc_portal/features/customerService/core/widgets/contact_person_info_loading_section.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_chat.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_divider_line.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_forwarded_for_section.dart';
import 'package:wncc_portal/features/customerService/core/widgets/loading_support_details_info.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/custom_close_request_btn_loading.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/customer_request_action_section_loading.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/loading_request_details_header.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/loading_request_types_action.dart';

class RequestDetailsLoadingPage extends StatelessWidget {
  const RequestDetailsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomRequestActionSectionLoading(),
          Divider(),
          CustomCloseRequestBtnLoading(),
          LoadingRequestDetailsHeader(),
          ContactPersonInfoLoadingSection(),
          LoadingSupportDetailsInfo(),
          SizedBox(height: 10),
          LoadingDividerLine(),
          SizedBox(height: 10),
          LoadingRequestTypesAction(),
          LoadingForwardedForSection(),
          LoadingChat(),
        ],
      ),
    );
  }
}



