import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({
    super.key,
    required this.emailController,
    required this.tryToChangePassword,
  });

  final TextEditingController emailController;
  final void Function(BuildContext) tryToChangePassword;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          GoRouter.of(context).push(
            AppRouter.validationCodePagePath,
            extra: emailController.text,
          );
        } else if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is ForgetPasswordLoading) {
          return const CustomButton(
            contant: "Loading..",
            color: kloadingColor,
            fontSize: 14,
            onTap: null,
          );
        }
        return CustomButton(
          contant: "Submit",
          color: kBtnColor,
          fontSize: 14,
          onTap: () {
            tryToChangePassword(context);
          },
        );
      },
    );
  }
}
