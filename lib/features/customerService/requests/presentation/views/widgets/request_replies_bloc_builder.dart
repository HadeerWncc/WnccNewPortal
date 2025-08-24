import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/request_details_entity.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/request_replies_cubit/request_replies_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_chat.dart';

class RequestRepliesBlocBuilder extends StatelessWidget {
  const RequestRepliesBlocBuilder({
    super.key,
    required this.user,
    required this.requestDetailsEntity,
  });

  final UserModel user;
  final RequestDetailsEntity requestDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestRepliesCubit, RequestRepliesState>(
      builder: (context, state) {
        if (state is RequestRepliesSuccess) {
          return RequestChat(
            user: user,
            requestId: requestDetailsEntity.id!,
            replies: state.requestReplies,
          );
        } else if (state is RequestRepliesFailure) {
          return Text(state.error);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
