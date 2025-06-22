import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/login_form.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: LoginForm(),
    );
  }
}
