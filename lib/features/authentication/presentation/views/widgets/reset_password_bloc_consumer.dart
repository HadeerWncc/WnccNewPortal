import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';

class ResetPasswordBlocConsumer extends StatelessWidget {
  const ResetPasswordBlocConsumer({
    super.key,
    required this.resetPassword,
  });
  final void Function(BuildContext) resetPassword;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          GoRouter.of(context).push(AppRouter.loginPath);
        } else if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return const CustomButton(
            contant: "Loading..",
            color: Color.fromARGB(255, 173, 208, 248),
            fontSize: 14,
            onTap: null,
          );
        }
        return CustomButton(
          contant: "Submit",
          color: kBtnColor,
          fontSize: 14,
          onTap: () {
            resetPassword(context);
          },
        );
      },
    );
  }
}
