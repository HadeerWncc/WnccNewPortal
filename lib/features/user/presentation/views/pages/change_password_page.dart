import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/change_password_body.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
      ),
      body: ChangePasswordBody(
        userModel: userModel,
      ),
    ));
  }
}
