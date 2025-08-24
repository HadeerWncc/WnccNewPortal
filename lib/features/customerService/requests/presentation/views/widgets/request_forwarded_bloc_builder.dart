import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/forwarded_for_section.dart';

class RequestForwardedblocBuilder extends StatelessWidget {
  const RequestForwardedblocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForwardedRequestCubit, ForwardedRequestState>(
      listener: (context, state) {
        if (state is ForwardedRequestToUserSuccess) {
          GoRouter.of(context).pop();
          ShowSnackbar.showSnackBar(
              context, 'Request Forwarded Successfuly', 'S');
        } else if (state is ForwardedRequestFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
        }
      },
      builder: (context, state) {
        if (state is ForwardedRequestSuccess) {
          return ForwardedForSection(forwardedUsers: state.forwardedUser);
        } else if (state is ForwardedRequestToUserSuccess) {
          return ForwardedForSection(forwardedUsers: state.forwardedUser);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
