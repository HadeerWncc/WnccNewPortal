import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_option.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_profile_password_bloc_consumer.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool resetPassword = false;
  @override
  Widget build(BuildContext context) {
    return resetPassword
        ? Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomPlaceholderInput(
                  controller: currentPasswordController,
                  labelText: 'Old Password',
                  secure: true,
                ),
                const SizedBox(height: 15),
                CustomPlaceholderInput(
                  controller: newPasswordController,
                  labelText: 'New Password',
                  secure: true,
                ),
                const SizedBox(height: 15),
                CustomPlaceholderInput(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  secure: true,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ChangeProfilePasswordBlocConsumer(
                    tryChangPassword: tryChangPassword,
                  ),
                ),
              ],
            ),
          )
        : ResetPasswordOption(
            onTap: (value) {
              setState(() {
                resetPassword = value;
              });
            },
          );
  }

  void tryChangPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //check and login
      context
          .read<FirstLoginChangePasswordCubit>()
          .changePassword(ChangePasswordEntity(
            currentPassword: currentPasswordController.text,
            newPassword: newPasswordController.text,
            confirmPassword: confirmPasswordController.text,
          ));
          setState(() {
          resetPassword = false;
          });
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
