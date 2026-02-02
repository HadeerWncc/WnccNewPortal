import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class ChangePasswordInputs extends StatelessWidget {
  const ChangePasswordInputs({
    super.key,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPlaceholderInput(
          labelText: 'Current Password',
          controller: currentPasswordController,
          secure: true,
        ),
        const SizedBox(height: 20),
        CustomPlaceholderInput(
          labelText: 'New Password',
          controller: newPasswordController,
          secure: true,
          // passwordRgex: true,
        ),
        const SizedBox(height: 20),
        CustomPlaceholderInput(
          labelText: 'Confirm Password',
          controller: confirmPasswordController,
          secure: true,
        ),
      ],
    );
  }
}
