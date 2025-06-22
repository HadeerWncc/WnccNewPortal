import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';

class CustomTextFormField2 extends StatefulWidget {
  const CustomTextFormField2(
      {super.key,
      required this.hintText,
      this.secure = false,
      this.onSaved,
      this.onChange,
      this.controller});
  final String hintText;
  final bool secure;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final TextEditingController? controller;

  @override
  State<CustomTextFormField2> createState() => _CustomTextFormField2State();
}

class _CustomTextFormField2State extends State<CustomTextFormField2> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onSaved: widget.onSaved,
      onChanged: widget.onChange,
      obscureText: widget.secure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field is required!';
        } else {
          return null;
        }
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xff979797),
        border: inputBorder(),
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(),
      ),
    );
  }
}
