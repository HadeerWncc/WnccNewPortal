import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/requests/data/models/request_details_model/request_details_model.dart';
import 'package:wncc_portal/features/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_cubit/forwarded_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/close_request_action_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/contact_person_info_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/custom_request_action_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/followup_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_for_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_details_header.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_details_info.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_replies_section.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_type_item_list.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/request_types_actions.dart';

class RequestDetailsBody extends StatelessWidget {
  const RequestDetailsBody({super.key, required this.requestDetailsEntity});
  final RequestDetailsEntity requestDetailsEntity;
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
          BlocBuilder<ForwardedCubit, ForwardedState>(
            builder: (context, state) {
              if (state is ForwardedSuccess) {
                return ForwardedForSection(forwardedUsers: state.forwardedUser);
              } else if (state is ForwardedFailure) {
                return Text(state.error);
              }
              return const CircularProgressIndicator();
            },
          ),
          RequestRepliesSection(),
        ],
      ),
    );
  }
}
