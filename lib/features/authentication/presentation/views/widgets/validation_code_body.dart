import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/validation_code_form.dart';

class ValidationCodeBody extends StatelessWidget {
  const ValidationCodeBody({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: ValidationCodeForm(
        email: email,
      ),
    );
  }
}
