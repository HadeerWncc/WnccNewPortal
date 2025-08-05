import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/close_request_action_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/contact_person_info_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/custom_request_action_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_for_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_chat.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_details_header.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_details_info.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_forwarded_bloc_builder.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_replies_bloc_builder.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_types_actions.dart';

class RequestDetailsBody extends StatelessWidget {
  const RequestDetailsBody(
      {super.key, required this.requestDetailsEntity, required this.user});
  final RequestDetailsEntity requestDetailsEntity;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomRequestActionSection(),
          const Divider(),
          const CloseRequestActionSection(),
          RequestDetailsHeader(
            requestDetailsEntity: requestDetailsEntity,
          ),
          ContactPersonInfoSection(
            requestDetailsEntity: requestDetailsEntity,
          ),
          RequestDetailsInfo(
            requestDetailsEntity: requestDetailsEntity,
          ),
          const SizedBox(height: 10),
          const DividerLine(),
          const SizedBox(height: 10),
          RequestTypesActions(requestDetailsEntity: requestDetailsEntity),
          const RequestForwardedblocBuilder(),
          RequestRepliesBlocBuilder(user: user, requestDetailsEntity: requestDetailsEntity),
        ],
      ),
    );
  }
}



