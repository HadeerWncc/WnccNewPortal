import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/validate_password_with_regex.dart';

class NewPasswordInput extends StatelessWidget {
  const NewPasswordInput({
    super.key,
    this.onCanged,
    this.textController,
    required this.hintText,
  });

  final void Function(String?)? onCanged;
  final TextEditingController? textController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validatePasswordWithRegex(value!);
      },
      controller: textController,
      onChanged: onCanged,
      obscureText: true,
      cursorColor: const Color(0xff979797),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: kHintColor, fontSize: 14, fontWeight: FontWeight.bold),
        border: changePassowrdInputBorder(),
        enabledBorder: changePassowrdInputBorder(),
        focusedBorder: changePassowrdInputBorder(),
      ),
    );
  }
}
