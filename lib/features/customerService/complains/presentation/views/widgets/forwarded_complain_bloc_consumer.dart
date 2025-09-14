import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/forwarded_complain_cubit/forwarded_complain_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/complain_forward_section.dart';

class ForwardedComplainBlocConsumer extends StatelessWidget {
  const ForwardedComplainBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForwardedComplainCubit, ForwardedComplainState>(
      listener: (context, state) {
        if (state is ForwardedComplainToUserSuccess) {
          GoRouter.of(context).pop();
          ShowSnackbar.showSnackBar(
              context, 'Complain Forwarded Successfuly', 'S');
        } else if (state is ForwardedComplainFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
        }
      },
      builder: (context, state) {
        if (state is ForwardedComplainSuccess) {
          return ComplainForwardSection(
            forwardUsers: state.forwardUsers,
          );
        } else if (state is ForwardedComplainToUserSuccess) {
          return ComplainForwardSection(
            forwardUsers: state.forwardedUser,
          );
        }
        return const SingleChildScrollView();
      },
    );
  }
}
