import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
    required this.tryLogin,
  });
  final void Function(BuildContext) tryLogin;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          BlocProvider.of<UserCubit>(context).getCurrentUser();
          if (state.loginModel.hasConfigurations == false) {
            GoRouter.of(context).pushReplacement(AppRouter.welcomePage);
          } else {
            GoRouter.of(context).pushReplacement(AppRouter.homePath);
          }
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return CustomButton(
            contant: "Loading..",
            color: kloadingColor,
            onTap: () async {
              null;
            },
          );
        }
        return CustomButton(
          contant: "Sign in",
          color: kBtnColor,
          onTap: () {
            tryLogin(context);
          },
        );
      },
    );
  }
}
