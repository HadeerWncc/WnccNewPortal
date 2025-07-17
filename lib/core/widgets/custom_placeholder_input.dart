import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/validate_password_with_regex.dart';
class CustomPlaceholderInput extends StatelessWidget {
  const CustomPlaceholderInput(
      {super.key,
      required this.controller,
      required this.labelText,
      this.width,
      this.actions,
      this.secure = false,
      this.passwordRgex = false,
      this.enable = true,
      this.onChanged,
      this.keyboardType, this.linesNum});
  final TextEditingController controller;
  final String labelText;
  final double? width;
  final List<Widget>? actions;
  final bool secure;
  final bool passwordRgex;
  final bool enable;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? linesNum;
  @override
  Widget build(BuildContext context) {
    double defaultWidth =
        MediaQuery.of(context).size.width * 1 - (kHorizontalPadding * 2);
    return Row(
      children: [
        SizedBox(
          width: width ?? defaultWidth,
          child: TextFormField(
             textAlignVertical: TextAlignVertical.top,
            autofocus: false,
            onChanged: onChanged,
            enabled: enable,
            validator: (value) {
              if (value!.isEmpty) {
                return 'field is required';
              } else if (passwordRgex == true) {
                return validatePasswordWithRegex(value);
              }
              return null;
            },
            minLines: linesNum ??1,
            maxLines: linesNum??1,
            keyboardType: keyboardType,
            controller: controller,
            obscureText: secure,
            cursorColor: Colors.black,
            style: const TextStyle(
              // fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              focusedBorder: customfocusedBorder(),
              fillColor: const Color(0xffF9F9F9),
                enabledBorder: inputBorder(),
              filled: true,
              labelText: labelText,
              alignLabelWithHint: true,
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 83, 83, 83),
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          children: actions ?? [],
        )
      ],
    );
  }
}
