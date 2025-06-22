import 'package:flutter/material.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/validation_code_body.dart';

class ValidationCodePage extends StatelessWidget {
  const ValidationCodePage({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValidationCodeBody(
          email: email,
        ),
      ),
    );
  }
}
