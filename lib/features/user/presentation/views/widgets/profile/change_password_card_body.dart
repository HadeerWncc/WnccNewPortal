import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_form.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_password_option.dart';

class ChangePasswordCardBody extends StatefulWidget {
  const ChangePasswordCardBody({
    super.key,
  });

  @override
  State<ChangePasswordCardBody> createState() => _ChangePasswordCardBodyState();
}

class _ChangePasswordCardBodyState extends State<ChangePasswordCardBody> {
  bool resetPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: resetPassword
          ? const ChangePasswordForm()
          : ResetPasswordOption(
              onTap: (value) {
                setState(() {
                  resetPassword = value;
                });
              },
            ),
    );
  }
}