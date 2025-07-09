import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/icons.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';

class ChangeProfilePasswordBlocConsumer extends StatelessWidget {
  const ChangeProfilePasswordBlocConsumer({
    super.key, required this.tryChangPassword,
  });
  final void Function(BuildContext) tryChangPassword;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FirstLoginChangePasswordCubit,
        FirstLoginChangePasswordState>(listener: (context, state) {
      if (state is FirstLoginChangePasswordFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.failureMsg)),
        );
      } else if (state is FirstLoginChangePasswordSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Updated Successfully")),
        );
      }
    }, builder: (context, state) {
      if (state is FirstLoginChangePasswordLoading) {
        return const CustomButtonWithIcon(
          child: 'Loading..',
          bgColor:  Color.fromARGB(255, 87, 178, 87),
          textColor: Colors.white,
          onHoverColor:  Color.fromARGB(255, 2, 172, 2),
          icon: loadingIcon,
          onTap: null,
        );
      }
      return CustomButtonWithIcon(
        child: 'Change Password',
        bgColor: const Color.fromARGB(255, 32, 124, 32),
        textColor: Colors.white,
        onHoverColor: const Color.fromARGB(255, 2, 172, 2),
        icon: Symbols.bookmarks,
        onTap: () {
          tryChangPassword(context);
        },
      );
    });
  }
}