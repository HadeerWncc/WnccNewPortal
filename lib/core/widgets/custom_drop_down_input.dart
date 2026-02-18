import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';

class CustomDropDownInput extends StatelessWidget {
  const CustomDropDownInput({
    super.key,
    required this.selectedValue,
    required this.items,
    this.onChanged,
    required this.title,
    this.width,
    this.hintText,
  });

  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final String title;
  final double? width;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    double defaultWidth =
        MediaQuery.of(context).size.width * 1 - (kHorizontalPadding * 2);
    return SizedBox(
      width: width ?? defaultWidth,
      child: DropdownButtonFormField<String>(
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: inputBorder(),
          focusedBorder: customfocusedBorder(),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          filled: true,
          labelText: title,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 83, 83, 83),
            fontSize: 12,
          ),
        ),
        value: items.contains(selectedValue) ? selectedValue : null,
        hint: hintText != null
            ? Text(
                hintText!,
                style: const TextStyle(
                  fontSize: 9,

                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              )
            : null,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: SizedBox(
                    child: Text(
                      item,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis, fontSize: 9),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
