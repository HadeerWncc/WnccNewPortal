import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/new_password_input.dart';

class ChangeYourPasswordForm extends StatefulWidget {
  const ChangeYourPasswordForm({
    super.key,
    this.id,
  });
  final String? id;
  @override
  State<ChangeYourPasswordForm> createState() => _ChangeYourPasswordFormState();
}

class _ChangeYourPasswordFormState extends State<ChangeYourPasswordForm> {
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
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: AlertDialog(
        title: const Text(
          'Change Your Password',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: Container(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewPasswordInput(
                hintText: 'Current Password',
                textController: currentPasswordController,
              ),
              const SizedBox(
                height: 7,
              ),
              NewPasswordInput(
                hintText: 'New Password',
                textController: newPasswordController,
              ),
              const SizedBox(
                height: 7,
              ),
              NewPasswordInput(
                hintText: 'Confirm Password',
                textController: confirmPasswordController,
              ),
            ],
          ),
        ),
        actions: [
          BlocConsumer<FirstLoginChangePasswordCubit,
              FirstLoginChangePasswordState>(
            listener: (context, state) {
              if (state is FirstLoginChangePasswordFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failureMsg)),
                );
              } else if (state is FirstLoginChangePasswordSuccess) {
                GoRouter.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Updated Successfully")),
                );
              }
            },
            builder: (context, state) {
              if (state is FirstLoginChangePasswordLoading) {
                return TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(kloadingColor),
                    shape: WidgetStatePropertyAll(
                      ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: null,
                  child: const Text(
                    "Loading..",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return TextButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(kBtnColor),
                  shape: WidgetStatePropertyAll(
                    ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  tryChangPassword(context);
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor:
          //   ),
          //   onPressed: () {
          //     // SaveNewPassword
          //   },
          //   child: const Text('Save'),
          // ),

          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text(
              'Close',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void tryChangPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //check and login
      context
          .read<FirstLoginChangePasswordCubit>()
          .changePassword(ChangePasswordEntity(
            id: widget.id,
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
