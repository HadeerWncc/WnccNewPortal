import 'package:flutter/material.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_form.dart';

class ChangePasswordCardBody extends StatelessWidget {
  const ChangePasswordCardBody({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(13),
        child: ChangePasswordForm(
          userModel: userModel,
        ));
  }
}
