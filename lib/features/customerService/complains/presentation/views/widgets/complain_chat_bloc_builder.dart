import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/complain_details_entity.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complain_replies_cubit/complain_replies_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/complain_chat.dart';

class ComplainChatBlocBuilder extends StatelessWidget {
  const ComplainChatBlocBuilder({
    super.key,
    required this.user,
    required this.complain,
  });

  final UserModel user;
  final ComplainDetailsEntity complain;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplainRepliesCubit, ComplainRepliesState>(
      builder: (context, state) {
        if (state is ComplainRepliesSuccess) {
          return ComplainChat(
            messages: state.messages,
            user: user,
            complainId: complain.id!,
          );
        } else if (state is ComplainRepliesFailure) {
          return Text(state.error);
        }
        return const SingleChildScrollView();
      },
    );
  }
}
