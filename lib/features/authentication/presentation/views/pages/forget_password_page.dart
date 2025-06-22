import 'package:flutter/material.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/forgot_password_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ForgotPasswordBody(),
      ),
    );
  }
}
