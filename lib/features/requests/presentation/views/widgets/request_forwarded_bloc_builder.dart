import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/forwarded_for_section.dart';

class RequestForwardedblocBuilder extends StatelessWidget {
  const RequestForwardedblocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForwardedRequestCubit, ForwardedRequestState>(
      builder: (context, state) {
        if (state is ForwardedRequestSuccess) {
          return ForwardedForSection(forwardedUsers: state.forwardedUser);
        } else if (state is ForwardedRequestFailure) {
          return Text(state.error);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
