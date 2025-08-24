import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';
import 'package:wncc_portal/core/widgets/divider_line.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/complain_replies_cubit/complain_replies_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/forwarded_complain_cubit/forwarded_complain_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_chat_bloc_builder.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_contact_person_info_section.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_details_header.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_details_info.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_follow_up_section.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/custom_complain_actions_section.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/forwarded_complain_bloc_consumer.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_all_users_cubit/get_all_users_cubit.dart';

class ComplainDetailsBody extends StatelessWidget {
  const ComplainDetailsBody(
      {super.key, required this.user, required this.complain});
  final UserModel user;
  final ComplainDetailsEntity complain;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ForwardedComplainCubit>(context)
        .getForwardedUsers(complain.id!);
    BlocProvider.of<ComplainRepliesCubit>(context)
        .getComplainReplies(complain.id!);
    BlocProvider.of<GetAllUsersCubit>(context).getAllUsers();

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomComplainActionsSection(
            complainId: complain.id!,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomMarkedColorContainer(
                title: getRequestStatusText(complain.status!),
                color: const Color.fromARGB(255, 5, 167, 65),
                bgColor: const Color.fromARGB(255, 234, 245, 238),
              ),
            ],
          ),
          ComplainDetailsHeader(
            complain: complain,
          ),
          ComplainContactPersonInfoSection(
            complain: complain,
          ),
          ComplainDetailsInfo(
            complain: complain,
          ),
          const SizedBox(height: 10),
          const DividerLine(),
          const SizedBox(height: 10),
          ComplainFollowUpSection(
            complainLogs: complain.logs ?? [],
          ),
          const ForwardedComplainBlocConsumer(),
          ComplainChatBlocBuilder(user: user, complain: complain),
        ],
      ),
    );
  }
}




