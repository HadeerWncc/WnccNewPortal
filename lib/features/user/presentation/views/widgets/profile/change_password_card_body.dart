import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_form.dart';

class ChangePasswordCardBody extends StatelessWidget {
  const ChangePasswordCardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(13),
      child: ChangePasswordForm()
    );
  }
}