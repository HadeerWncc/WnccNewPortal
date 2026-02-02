import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/change_password_bloc_consumer.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/change_password_inpute.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const FormHeading(
              title: 'Reset Password',
              subTitle: 'Change your password.',
            ),
            const SizedBox(height: 30),
            ChangePasswordInputs(
              currentPasswordController: currentPasswordController,
              newPasswordController: newPasswordController,
              confirmPasswordController: confirmPasswordController,
            ),
            const SizedBox(
              height: 20,
            ),
            // const Opacity(
            //   opacity: .5,
            //   child: Text(
            //     'Use 8 or more characters with a mix of letters, numbers and symbols.',
            //     style: TextStyle(
            //       fontSize: 12,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWithIcon(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.selectStartupRouting,
                        extra: {'userId': widget.userModel.id!});
                  },
                  child: 'Skip',
                  bgColor: const Color(0xffF1F1F3),
                  textColor: Colors.black,
                  icon: Symbols.swipe_up,
                  onHoverColor: const Color.fromARGB(255, 179, 179, 179),
                ),
                const SizedBox(width: 13),
                ChangePasswordBlocConsumer(
                  tryChangPassword: tryChangPassword,
                  userId: widget.userModel.id!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void tryChangPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //check and login
      context
          .read<FirstLoginChangePasswordCubit>()
          .changePassword(ChangePasswordEntity(
            id: widget.userModel.id,
            currentPassword: currentPasswordController.text,
            newPassword: newPasswordController.text,
            confirmPassword: confirmPasswordController.text,
          ));
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
