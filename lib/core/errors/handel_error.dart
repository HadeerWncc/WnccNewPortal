import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

Set<Set<void>> handelError(UserState state, BuildContext context) {
  return {
    if (state is UserFailure)
      {
        ShowSnackbar.showSnackBar(context, state.error, 'F'),
        GoRouter.of(context).go(AppRouter.errorPagePath, extra: state.error)
      }
  };
}
