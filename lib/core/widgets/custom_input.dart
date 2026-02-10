import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: TextEditingController(text: '1256'),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        enabledBorder: inputBorder(),
        border: inputBorder(),
        focusedBorder: customfocusedBorder(),
      ),
    );
  }
}
