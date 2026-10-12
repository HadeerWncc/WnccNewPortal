import 'package:flutter/material.dart';

class CustomTableInputCell extends StatelessWidget {
  const CustomTableInputCell(
      {super.key,
      this.keyboardType,
      this.controller,
      this.onChanged,
      this.enable = true});
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        child: TextField(
          style: const TextStyle(fontSize: 15),
          enabled: enable,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xffF9FAFC)),
              gapPadding: 0
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 224, 224, 224)),
                  gapPadding: 0
            ),
            contentPadding: const EdgeInsets.all(0),
            
          ),
        ),
      ),
    );
  }
}
