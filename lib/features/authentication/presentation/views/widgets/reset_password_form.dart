import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/reset_password_bloc_consumer.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
    required this.validateModel,
  });
  final ValidateCodeModel validateModel;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FormHeading(
            title: 'Setup New Password',
            subTitle: 'Have you already reset the password ? ',
            link: 'Sign in',
            gosTo: AppRouter.loginPath,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            textController: passwordController,
            hintText: "Password",
            secure: true,
            passwordRgex: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            textController: resetPasswordController,
            hintText: "Repeat password",
            secure: true,
            passwordRgex: true,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ResetPasswordBlocConsumer(
              resetPassword: resetPassword,
            ),
          ),
        ],
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await context.read<ResetPasswordCubit>().resetPassword(
            ResetPasswordEntity(
              email: widget.validateModel.email!,
              token: widget.validateModel.token!,
              newPassword: passwordController.text,
              confirmPassword: resetPasswordController.text,
            ),
          );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
