import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/validate_password_with_regex.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.secure = false,
    this.onCanged,
    this.textController,
    this.passwordRgex = false,
    this.keyboardType,
  });

  final String hintText;
  final bool secure;
  final void Function(String?)? onCanged;
  final TextEditingController? textController;
  final bool passwordRgex;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        } else if (passwordRgex == true) {
          return validatePasswordWithRegex(value);
        }
        return null;
      },
      keyboardType: keyboardType,
      controller: textController,
      onChanged: onCanged,
      obscureText: secure,
      cursorColor: const Color(0xff979797),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: kHintColor, fontSize: 14, fontWeight: FontWeight.bold),
        border: inputBorder(),
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(),
      ),
    );
  }
}
