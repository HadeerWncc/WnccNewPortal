import 'package:flutter/material.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LoginPageBody(),
      ),
    );
  }
}
