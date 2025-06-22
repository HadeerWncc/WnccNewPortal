import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class ChangePasswordBlocConsumer extends StatelessWidget {
  const ChangePasswordBlocConsumer({super.key, required this.tryChangPassword});
  final void Function(BuildContext) tryChangPassword;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FirstLoginChangePasswordCubit,
        FirstLoginChangePasswordState>(
      listener: (context, state) {
        if (state is FirstLoginChangePasswordFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failureMsg)),
          );
        } else if (state is FirstLoginChangePasswordSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.selectStartupRouting);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Updated Successfully")),
          );
        }
      },
      builder: (context, state) {
        if (state is FirstLoginChangePasswordLoading) {
          return const CustomButtonWithIcon(
            onTap: null,
            child: 'Loading',
            bgColor: Color(0xffE9F3FF),
            textColor: Colors.blueAccent,
            icon: Symbols.done_all,
            onHoverColor: kBtnColor,
          );
        }
        return CustomButtonWithIcon(
          onTap: () {
            tryChangPassword(context);
          },
          child: 'Submit',
          bgColor: const Color(0xffE9F3FF),
          textColor: Colors.blueAccent,
          icon: Symbols.done_all,
          onHoverColor: kBtnColor,
        );
      },
    );
  }
}
