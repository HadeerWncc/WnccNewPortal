import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_check_box.dart';
import 'package:wncc_portal/features/authentication/domain/entities/login_entity.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/login_bloc_consumer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool rememberme = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // SizedBox(
          //         height: 20,
          //       ),
          Container(
            width: MediaQuery.of(context).size.height * 0.2,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/download.jfif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            hintText: 'User Name',
            textController: userNameController,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Password',
            textController: passwordController,
            secure: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.forgetPasswordPath);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: kBtnColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomCheckbox(
                activeColor: kBtnColor,
                isChecked: rememberme,
                onChanged: (value) {
                  setState(() {
                    rememberme = value ?? false;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          LoginBlocConsumer(
            tryLogin: tryLogin,
          ),
        ],
      ),
    );
  }

  void tryLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //check and login
      await context.read<AuthCubit>().login(
            loginEntity: LoginEntity(
                userName: userNameController.text,
                password: passwordController.text,
                remmemberMe: rememberme),
          );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
