import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/change_password_body.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
      ),
      body: const ChangePasswordBody(),
    ));
  }
}
