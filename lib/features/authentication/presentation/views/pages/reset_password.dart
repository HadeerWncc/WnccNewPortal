import 'package:flutter/material.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/reset_password_body.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
    required this.validateCodeModel,
  });
  final ValidateCodeModel validateCodeModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResetPasswordBody(
          validateModel: validateCodeModel,
        ),
      ),
    );
  }
}
