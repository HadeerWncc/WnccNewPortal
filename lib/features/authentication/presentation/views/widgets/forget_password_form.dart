import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/forget_password_bloc_consumer.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width * .3;
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FormHeading(
            title: 'Forgot Password ?',
            subTitle: 'Enter your email to reset your password.',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            textController: emailController,
            hintText: "Email ",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: btnWidth,
                child: ForgetPasswordBlocConsumer(
                  emailController: emailController,
                  tryToChangePassword: tryToChangePassword,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: btnWidth,
                child: CustomButton(
                  contant: "Cancel",
                  color: const Color(0xfff9f9f9),
                  textColor: Colors.black,
                  fontSize: 14,
                  onTap: () async {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void tryToChangePassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().forgetPassword(emailController.text);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
